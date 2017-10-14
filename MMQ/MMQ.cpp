#include <iostream>
#include <fstream> //header necessario per fstream!
#include <stdlib.h>
#include <sstream>
#include <myfunc.h>

using namespace std;

double stod(string str)
{	
	double Result;
	stringstream convert(str);
	if ( !(convert >> Result) )
		Result = 0;	
	return Result;
} 


int main() {
	cout<<"Questo programma calcolerà la migliore retta con il metodo dei minimi quadrati!"<<endl;
int i,j,n,file;
int m=20;
double x[m], y[m],s[m];
i=0;
bool ok;
	string linea, cella;
	cout<<"Se vuoi che legga un file (dati.csv) digita 1, altrimenti digita 0"<<endl;
	file=0;
	cin>>file;
	j=0;
	if(file==1){
		fstream f("dati.csv", ios::in);
		if(f.is_open()==0){cout<<"File non trovato"<<endl; return 0;}
		i=0;
		while(f.good()){
        getline(f, linea);
			stringstream linestream(linea);
			i=i+1;
			while(getline(linestream, cella,',')){
				switch(j){
					case 0:
						x[i]=stod(cella); j=1;
						break;
					case 1:
						y[i]=stod(cella); j=2;
						break;
					case 2:
						s[i]=stod(cella);;
						break;
				}
			}
			j=0;
		}
		n=i-1;
		f.close();
	}else{
	ok=false;
		i=1;
		cout<<"Quanti punti vuoi inserire?"<<endl;
	cin>>n;
	if((n<m)and(n>1)){ok=true;}
	while(!ok){
		cout<< "Quanti punti vuoi inserire? (Devi inserirne almeno due!!)"<<endl;
		cin>>n;
		if((n<m)and(n>1)){ok=true;}
	}
	while(i<=n){
		cout<<"Inserisci le coordinate del punto numero "<<i<<endl;
		cout <<"x: ";
		cin >>x[i];
		cout<<"y: ";
		cin>>y[i];
		cout<<"errore y: ";
		cin>>s[i];
		i=i+1;
	}
		}
	//Inizio calcoli
	double B[3][2]; //matrice termini noti
	double ys[m];
	i=1;
	while(i<=n){
		ys[i]=y[i]/(s[i]*s[i]);
		i=i+1;
	}
	B[1][1]=somma(ys,n);
	i=1;
	double xy[m];
	while(i<=n){
		xy[i]=x[i]*y[i]/(s[i]*s[i]);
		i=i+1;
	}
	B[2][1]=somma(xy,n);
	double d[3][3];
	i=1;
	double si[m];
	while(i<=n){
		si[i]=1/(s[i]*s[i]);
		i=i+1;
	}
	d[1][1]=somma(si,n);
	i=1;
	double xs[m];
	while(i<=n){
		xs[i]=x[i]/(s[i]*s[i]);
		i=i+1;
	}
	d[1][2]=somma(xs,n);
	d[2][1]=d[1][2];
	i=1;
	double x2[m];
	while(i<=n){
		x2[i]=x[i]*x[i]/(s[i]*s[i]);
		i=i+1;
	}
	d[2][2]=somma(x2,n);
	double det;
	det=d[1][1]*d[2][2]-d[1][2]*d[2][1];
	double dt[3][3];
	dt[1][1]=d[2][2];
	dt[1][2]=-d[1][2];
	dt[2][1]=-d[2][1];
	dt[2][2]=d[1][1];
	i=1;
	j=i;
	while(i<=2){
		while(j<=2){
		dt[i][j]=dt[i][j]/det;
			j=j+1;
		}
		j=0;
		i=i+1;
	}
	double a,b,siga,sigb,sigab;
	a=dt[1][1]*B[1][1]+dt[1][2]*B[2][1];
	b=dt[2][1]*B[1][1]+dt[2][2]*B[2][1];
	siga=dt[1][1];
	sigb=dt[2][2];
	sigab=dt[1][2];
	cout.precision(3);
	if (a!=0){
		if(b>0){
			cout<<"La migliore retta e': y=" <<fixed <<a <<"+ " <<b <<"x" <<endl;
	}else
	{if(b!=0){
		cout<<"La migliore retta e': y=" <<fixed <<a  <<b <<"x" <<endl;
	}else{cout<<"La migliore retta e': y=" <<fixed <<a<<endl;
	}
	}
	}else{if(b>0){
		cout<<"La migliore retta e': y=" <<fixed <<b <<"x" <<endl;
	}else
	{if(b!=0){
		cout<<"La migliore retta e': y=" <<fixed  <<b <<"x" <<endl;
	}
	}
	}
//Fine conti
	cout<<"a= "<<fixed<<a<<"±"<<siga<<endl;
	cout<<"b= "<<fixed<<b<<"±"<<sigb<<endl;
	cout<<"correlazione= "<<fixed<<sigab<<endl;
	//Chi quadro
	i=1;
	double chi,chired;
	chi=chisquare(x,y,s,n,a,b,0);
	chired=chi/(n-2);
	cout.precision(2);
	cout<<"Il chi quadro vale: "<<fixed<<chi<<endl;
	cout<<"Il chi quadro ridotto: "<<fixed<<chired<<endl;
//Per debug:-)
//cout<<d[1][1]<<" "<<d[1][2]<<" "<<d[2][1]<<" "<<d[2][2]<<" ";
//cout<<dt[1][1]<<" "<<dt[1][2]<<" "<<dt[2][1]<<" "<<dt[2][2]<<" ";
//cout<<B[1][1]<<" "<<B[2][1]<<" ";
	
	cout <<"Vuoi salvare i dati? \n"<< "Scrivi 1 per Sì e 0 per No  ";
	int salvo;
	cin >> salvo;	
	
	if(risp(salvo)){
	fstream f("risultati.csv", ios::out);
	if(!f) {
        cout <<"Errore nella creazione del file!";
        return -1;
    }
	
	i=1;
	f<<"Dati raccolti \n";
	f<<"x, y \n";
	while(i<=n){
	f<<x[i]<<","<<y[i]<<","<<s[i]<<"\n";
		i=i+1;
	}
	if(b>=0){f<<",,La migliore retta e': y=" <<fixed <<a <<"+ " <<b <<"x" <<endl;
			}else{
				f<<",,La migliore retta e': y=" <<fixed <<a  <<b <<"x" <<endl;}
		f<<",,a= "<<fixed<<a<<"±"<<siga<<endl;
		f<<",,b= "<<fixed<<b<<"±"<<sigb<<endl;
		f<<",,correlazione= "<<fixed<<sigab<<endl;
		f<<",,Il chi quadro vale: "<<fixed<<chi<<endl;
		f<<",,Il chi quadro ridotto: "<<fixed<<chired<<endl;
		f.close();
	cout<<"Il file risultati.csv è stato salvato correttamente!" <<endl;
	}else{
	cout<<"Fine :-)"<<endl;
	}	
    return 0;
    }
