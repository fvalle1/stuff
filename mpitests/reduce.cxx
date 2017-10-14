// Author: Marco Aldinucci
// Date: 13 May 2010
// Ex 3, for PDS-physics class 2010

#include "mpi.h"
#include <iostream>
#include <string.h>
#include <stdlib.h>
#include <sys/time.h>
#include <cmath>

enum messages {root};

#define MAX(A,B) (A)>(B)?(A):(B)
#define MIN(A,B) (A)<(B)?(A):(B)
#define ABS(A) (A)>0?(A):(-A)

static inline const double diffmsec(const struct timeval & a, 
									const struct timeval & b) {
  long sec  = (a.tv_sec  - b.tv_sec);
  long usec = (a.tv_usec - b.tv_usec);

  if(usec < 0) {
	--sec;
	usec += 1000000;
  }
  return ((double)(sec*1000)+ (double)usec/1000.0);
}

int mcd_f(int a, int b) {
  int max,min;
  a = ABS(a);
  b = ABS(b);
  max = MAX(a,b);
  min = MIN(a,b);
  if (min==0) return max;
  else return mcd_f(max%min,min);
}

void mcd(int *invec, int *inoutvec, int *len, MPI_Datatype *dtype)
{
  int i;
  for ( i=0; i<*len; i++ ) 
	inoutvec[i] = mcd_f(invec[i],inoutvec[i]);
}

int main( int argc, char **argv )
{
  int myid,numprocs,namelen;
  char processor_name[MPI_MAX_PROCESSOR_NAME];
  double t0,t1;
  // MPI_Wtime cannot be called here
  MPI_Init(&argc,&argv );
  MPI_Comm_size(MPI_COMM_WORLD,&numprocs); 
  MPI_Comm_rank(MPI_COMM_WORLD,&myid); 
  MPI_Get_processor_name(processor_name,&namelen);
  srandomdev();
  // ------- reduce sum
  int myvalue = myid+(random()&11);
  int result;
  std::cout << "[" << myid << "a] " << myvalue << "\n"; 
  if (myid==root) t0 = MPI_Wtime();
  MPI_Reduce(&myvalue,&result,1, MPI_INT,MPI_SUM,root, MPI_COMM_WORLD);
  if (myid==root) {
	t1 = MPI_Wtime();
	std::cout << "Reduce SUM time " << t1-t0 << "\n";
	std::cout << "Result is " << result << "\n"; 
	std::cout << "------------\n"; 
  }
  std::cout.flush();
  MPI_Barrier(MPI_COMM_WORLD);
  // ------- reduce mcd
  MPI_Op op;
  myvalue = random()&1111;
  std::cout << "[" << myid << "b] " << myvalue << "\n"; 
  if (myid==root) t0 = MPI_Wtime();
  MPI_Op_create( (MPI_User_function *)mcd, 1, &op );
  MPI_Reduce(&myvalue,&result,1, MPI_INT,op,root, MPI_COMM_WORLD);
  MPI_Op_free( &op );
  if (myid==root) {
	t1 = MPI_Wtime();
	std::cout << "Reduce MCD time " << t1-t0 << "\n";
	std::cout << "Result is " << result << "\n"; 
	std::cout << "------------\n"; 
  }
  std::cout.flush();
  MPI_Barrier(MPI_COMM_WORLD);
  // ------- reduce sum star
  int round = 0;
  int target;
  myvalue = random()&1111;
  std::cout << "[" << myid << "c] " << myvalue << "\n"; 
  if (myid==root) t0 = MPI_Wtime();
  if (myid==root) {
	// center of the star - receiving messages from all others
	MPI_Status status;
	for (int i=0; i<numprocs-1; ++i) {
	  MPI_Recv(&target,1, MPI_INT, MPI_ANY_SOURCE,round,
			   MPI_COMM_WORLD, &status);
	  myvalue +=  target; // here substitute mcd_f() to reduce mcd
	  std::cout << "Star center get " << target << "\n";
	}
	++round;
  } else {
	MPI_Send(&myvalue,1, MPI_INT,root,round,MPI_COMM_WORLD);
	++round;
  }
  if (myid==root) {
	t1 = MPI_Wtime();
	std::cout << "Reduce SUM star time " << t1-t0 << "\n";
	std::cout << "Result is " << myvalue << "\n"; 
	std::cout << "------------\n"; 
  }
  std::cout.flush();
  MPI_Barrier(MPI_COMM_WORLD);
  // ------- reduce sum ring
  // Per esercizio
  // ------- reduce sum tree
  double depth = log2(numprocs);
  int depth_i = (int) ceil(depth);
  int turn = 2;
  bool do_send = ((myid % turn)==1);
  bool leaves = do_send;
  int sendto;
  if (myid==root) t0 = MPI_Wtime();
  myvalue = myid; // random()&1111; 
  for (int i=0; i< depth_i; ++i){
	if (myid % turn == 0) {
	  if (myid + turn/2 < numprocs) {
		MPI_Status status;
		int target;
		//std::cout << "R[" << myid << "] <-" << turn << "- " << myid + turn/2 << "\n";
		MPI_Recv(&target,1, MPI_INT,myid + turn/2,round,MPI_COMM_WORLD, &status);
		myvalue = target + myvalue;
	  } 
	  // This is a leaf, the tree is unbalanced
	  if ((numprocs/(turn-1)<=myid) && (myid!=0)){
		//std::cout << " Node " << myid << " is a leaf\n";
		leaves = true;
	  }
	}
	sendto = myid - turn/2;
	if ((do_send) || (leaves)) {
	  //std::cout << "S[" << myid << "] -" << turn << "-> " << sendto << "\n";
	  MPI_Send(&myvalue,1, MPI_INT, sendto,round,MPI_COMM_WORLD);
	}
	leaves = false;
	do_send = (myid % turn == 0);
	turn *=2;
	do_send &= !(myid % turn == 0);
	++round;
  }
  
  if (myid==root) {
	t1 = MPI_Wtime();
	std::cout << "Reduce SUM tree time " << t1-t0 << "\n";
	std::cout << "Result is " << myvalue << "\n"; 
	std::cout << "------------\n"; 
  }
  std::cout.flush();
  MPI_Barrier(MPI_COMM_WORLD);
  // ----
  MPI_Finalize();
  return 0;
}
