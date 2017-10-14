#include "mpi.h"

#include <iostream>
#include <cstdlib>

enum id{root};

int main(int argc, char *argv[]) {

  int n=100;
  int numprocs, myid, namelen;
  char processor_name[MPI_MAX_PROCESSOR_NAME];

  int total=0;

  MPI_Init(&argc, &argv);
  MPI_Comm_size(MPI_COMM_WORLD,&numprocs);
  MPI_Comm_rank(MPI_COMM_WORLD,&myid);
  MPI_Get_processor_name(processor_name,&namelen);
  srand48(time(NULL)+(myid*100000));


  int myvalue=0;
  int target=0;
  int status=0;
  int iteration=100000;

  double t0=MPI_Wtime();

  if(myid==root){
    for (int i=0; i<numprocs-1; ++i) {
  	  MPI_Recv(&target,1, MPI_INT, MPI_ANY_SOURCE,0,
  			   MPI_COMM_WORLD, MPI_STATUS_IGNORE);
  	  myvalue +=  target;
    }
    printf("I am %d, value is: %d\n",myid, myvalue);
    printf ("I think pi should be: %f\n\n",(double)myvalue/(numprocs-1)/iteration*4);
    double ctime=MPI_Wtime();
    printf("time: %f\n\n",(ctime-t0));
  }else{
    for(int i=0;i<iteration;i++){
    double x=((double)drand48());
    double y=((double)drand48());
    int d=x*x+y*y;
    myvalue+=(d<1?1:0);
  }
    //printf("I am %d, my value is: %d\n",myid, myvalue);
    MPI_Send(&myvalue,1, MPI_INT,0,0,MPI_COMM_WORLD);
  }

  MPI_Finalize();
  return 0;
}
