#include <iostream>
#include <fstream> //header necessario per fstream!
#include <stdlib.h>
#include <sstream>
#include <myfunc.h>

using namespace std;

double somma (double* a, int n){
	int i;
	i=1;
	double somma;
	somma=0;
	while (i<=n){somma=somma+a[i];
		i=i+1;
	}
	return somma;
}



bool risp (int risposta) {
	bool r;
	r=false;
	r= (risposta==1);
	return r;
}

double chisquare(double* x, double* y,double* s,int n,double a, double b, double c){
	double diff2[n+1];
	double chi;
	int i;
	i=1;
	while(i<=n){
		diff2[i]=y[i]-a-b*x[i]-c*x[i]*x[i];
		diff2[i]=diff2[i]*diff2[i];
		diff2[i]=diff2[i]/(s[i]*s[i]);
		i=i+1;
	}
	chi=somma(diff2,n);
	return chi;
}
