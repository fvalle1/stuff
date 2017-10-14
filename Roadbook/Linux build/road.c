#include<iostream>
#include<fstream>
#include<sstream>
#include <iomanip>
using namespace std;


int main() {
bool exe;
int i=0;
double ktot, kpar;
int dir;
double log, lom, los, lag, lam, las, lon, lat;
lon = 0;
lat = 0;
string leg, lons, lats;
char ns, eo;
string img[11];
ktot=0;
kpar=0;
bool found;
string ext, file, note;
ext=".csv";
file="Road";
string notedef="//";
file=file+ext;
fstream road(file.c_str(), ios::out); //|ios:: app );
string s;
int n=10;
if(!road) {
     cout <<"Errore nella creazione del file!";
    return -1;
    }
    
road << "N " <<";" << "Km totali " <<";" << "km parziali "  <<";" "Longitudine" <<";" "Latitudine" <<";" <<"Direzione" <<";" << "Note" <<endl;
img[1]="=►";
img[2]="◄=";
img[3]="▲";
img[4]="▼";
img[5]="○";
img[6]="♂";
img[7]="╩";
img[8]="╤";
img[9]="╢";
img[10]="╞";
exe=true;

cout <<"_____________" <<endl;
cout <<"Benvenuto in Road maker" <<endl;
cout <<"ti basterà inserire una tappa per volta" <<endl;
cout <<"e avrai un roadbook completo!" <<endl;
cout <<"(dopo ogni inserimento premi invio)" <<endl;




while(exe=true) {
	i=i+1;
	cout << "Siamo alla tappa numero " <<i <<endl;
   	cout << "Inserisci i kilmetri parziali (0 per chiudere):  ";  
   	cin >> kpar;
	cout << endl;
	if (kpar==0){break;}
	cout << "Inserisci il codice per la direzione (0 per help):  ";
	cin >> dir;
	while(dir>n){
	cout <<"riprova: ";
	cin >> dir;}
	cout << endl;
	found = false;
	while (found==false){
	switch (dir){
	case (0):
	for (int j=1; j<=n; j++){
		cout << j <<img[j] << endl;
	}
	cout << "Inserisci il codice per la direzione:  ";
	cin >> dir;
	cout << endl;
	break;
	case (1):
	img[0] = img[1];
	found=true;
	break;
	case (2):
	img[0] = img[2];
	found=true;
	break;;
	case (3):
	img[0] = img[3];
	found=true;
	break;
	case (4):
	img[0] = img[4];
	found=true;
	break;
	case (5):
	img[0] = img[5];
	found=true;
	break;
	case (6):
	img[0] = img[6];
	found=true;
	break;
	case (7):
	img[0] = img[7];
	found=true;
	break;
	case (8):
	img[0] = img[8];
	found=true;
	break;
	case (9):
	img[0] = img[9];
	found=true;
	break;
	case (10):
	img[0] = img[10];
	found=true;
	break;
	}
}
cout <<"Come vuoi inserire le coordinate per intero o con decimali?"<<endl;
cout <<"(digita int o dec)"<<endl;
cin >> leg;
cout << "Inserisci le coordinate: ";
if (leg=="int" or leg=="INT"){
  	cout <<"Longitudine:  ";
   	cout << "Gradi: ";
   	cin >> log;
   	while (log>90){
		cout << "Riprova: ";
		cin >> log;}
   	cout << "Minuti: ";
   	cin >> lom;
   	while (lom>60){
		cout << "Riprova: ";
		cin >> lom;}
   	cout<<"Secondi: ";
   	cin >> los;
   	while (los>60){
		cout << "Riprova: ";
		cin >> los;}
   	cout <<"e o o?";
	cin >> eo;
	cout << endl;
	cout <<"Latitudine: ";
   	cout << "Gradi: ";
   	cin >> lag;
   	while (lag>90){
		cout << "Riprova: ";
		cin >> lag;}
   	cout << "Minuti: ";
   	cin >> lam;
   	while (lam>60){
		cout << "Riprova: ";
		cin >> lam;}
   	cout<<"Secondi: ";
   	cin >> las;
   	while (las>60){
		cout << "Riprova: ";
		cin >> las;}
	   	cout <<"n o s?";
	cin >> ns;
	cout << endl;
	lon=log+lom/60+los/3600;
	if (eo=='o'){lon=-lon;}
	lat=lag+lam/60+las/3600;
	if (ns=='s'){lat=-lat;}
}
else{  
   	cout <<"Longitudine: ";
   	cin >> lon;
   	cout << "Latitudine: ";
   	cin >>lat;
   	}

//from here
   	 
   	  //kpar=10;
   	  
//to here is for debug porpuses 
    
    ostringstream convert;   
	convert << lon;  
	lons = convert.str();
    ostringstream convert1;   
	convert1 << lat;  
   	lats = convert1.str();
	cout<<"Se hai delle note puoi inserirle adesso, altrimenti premi solo invio"<<endl;
	note=notedef;
	cin >> note;
   	string google="http://maps.google.com/?ie=UTF8&ll="+lats+","+lons+"&z=13";
   	string apple="http://maps.apple.com/?ll="+lats+","+lons+"&z=13&t=k";
   	ktot=ktot+kpar; 
	road << i <<";" << ktot <<";" <<kpar <<";" << setw(3) <<lon <<";" << setw(3) <<lat <<";" << img[0] <<";" <<note << ";" << google <<apple << endl;
}
    road.close();
    cout << "Grazie il tuo file " <<file <<" è stato salvato";
    cout<< "@Filippo Valle-some right reserved Questo lavoro è protetto da licenza creative commons by-nc" <<endl;
    }
