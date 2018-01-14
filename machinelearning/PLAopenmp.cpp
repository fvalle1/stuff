/*
Perceptron learning algorithm implemented with openMP
*/
#include <iostream>
#include <cstdlib>
#include <vector>
#include <omp.h>

using namespace std;

//function to label points
bool label(double* x){
  return x[1]<0.5;
}

int classify(double* x, double* w){
  double dot=0.;
  for(int i=0;i<3;i++){
    dot+=x[i]*w[i];
  }

  return (dot>0?1:-1);
}

int main(int argc, char const *argv[]) {
  int ndata=1000000;
  srand48(time(NULL));
  //feature vector
  double** x=new double*[ndata];
  int y[ndata];
  int pred[ndata];

  //random fill weigth array
  int threshold=0;
  bool learnt=true;
  int misclassified=-1;
  double **w=new double*[ndata];

  //fill data
  #pragma omp parallel for shared(x)
  for (int i = 0; i < ndata; i++) {
    x[i]=new double[3];

    //x[0]
    x[i][0]=1;
    x[i][1]=drand48()*2-1;
    x[i][2]=drand48()*2-1;
    y[i]=(label(x[i])?1:-1);

    //printf("[%f,%f,%f] [%d]\n",x[i][0],x[i][1],x[i][2],y[i]);
  }

  #pragma omp parallel for default(shared)
  for (int i = 0; i < ndata; i++){
    w[i]=new double[3];

    w[i][0]=-threshold;
    w[i][1]=drand48()*2-1;
    w[i][2]=drand48()*2-1;

    pred[i]=classify(x[i],w[i]);

    // printf("w [%f,%f,%f]\n",w[i][0],w[i][1],w[i][2]);
    // printf("x [%f,%f,%f] [%d] [%d]\n",x[i][0],x[i][1],x[i][2],y[i],pred[i]);
    if(pred[i]!=y[i]){
      learnt=false;
      misclassified=i;
    }

    //printf("\n");
  }

  //learn
  while (!learnt) {
    // printf("before:\n\nw [%f,%f,%f]\n",w[misclassified][0],w[misclassified][1],w[misclassified][2]);
    // printf("x [%f,%f,%f] [%d] [%d]\n",x[misclassified][0],x[misclassified][1],x[misclassified][2],y[misclassified],pred[misclassified]);
    // printf("\n\n");
    for(int i=0; i<3; i++){
      w[misclassified][i]=w[misclassified][i]+y[misclassified]*x[misclassified][i];
    }

    pred[misclassified]=classify(x[misclassified],w[misclassified]);
    // printf("after learn:\n\nw [%f,%f,%f]\n",w[misclassified][0],w[misclassified][1],w[misclassified][2]);
    // printf("x [%f,%f,%f] [%d] [%d]\n",x[misclassified][0],x[misclassified][1],x[misclassified][2],y[misclassified],pred[misclassified]);
    learnt=true;

    for(int i=misclassified-1;i>=0;i--){
      if(pred[i]!=y[i]){
        learnt=false;
        misclassified=i;
        break;
      }
    }

    //printf("\n\n\n\n\n");
  }

  #pragma omp for shared(x,y)
  for(int i = 0; i < ndata; i++){
    delete x[i];
  }
  delete[] x;

  #pragma omp for
  for(double X=-1; X<1; X+=0.1){
    for(double Y=-1; Y<1; Y+=0.1){

    }
  }

  return 0;
}
