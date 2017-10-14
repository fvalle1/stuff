#include "mpi.h"

int main(int argc, char *argv[]) {

  int size, id;
  int tag=0;
  int first=0;

  MPI_Init(&argc, &argv);
  MPI_Comm_rank(MPI_COMM_WORLD,&id);
  MPI_Comm_size(MPI_COMM_WORLD,&size);


  printf("\nI am %d of: %d \n",id,size);
  int message=2;

  int sendto=(id+1)%(size);
  printf("\t I send message to: %d",sendto);
  MPI_Send(&message,1,MPI_INT,sendto,tag++,MPI_COMM_WORLD);

  int receivefrom=(id-1>=0?id-1:size-1);
  printf("\t I receive message from: %d",receivefrom);
  MPI_Recv(&message,1,MPI_INT,id-1,tag++,MPI_COMM_WORLD,MPI_STATUS_IGNORE);

  MPI_Finalize();
  return 0;
}
