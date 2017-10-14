#include <iostream>
#include <cstdlib>

enum id{root};

int main(int argc, char *argv[]) {

  int n=100;
  srand48(time(NULL));

  int myvalue=0;
  int iteration=100000;
  int numprocs=10;

  double t0=clock();

    for (int i=0; i<numprocs*iteration; ++i) {
      double x=((double)drand48());
      double y=((double)drand48());
      int d=x*x+y*y;
      myvalue+=(d<1?1:0);

    }
    printf("I am %d, value is: %d\n",0, myvalue);
    printf ("I think pi should be: %f\n\n",(double)myvalue/(numprocs-1)/iteration*4);
    double ctime=clock();
    printf("time: %f\n\n",(ctime-t0));

  return 0;
}
