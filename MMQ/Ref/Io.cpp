#include <fstream> //header necessario per fstream! 
#include <iostream>
using namespace std; 

int main() { 
	fstream f("file.txt", ios::out); //apre il file in scrittura cancellando quello che gi 'e0 c'era senza app 
	string s; 
	
	if(!f) { 
		cout <<"Errore nella creazione del file!"; 
		return -1; 
	} 
	
	f << "Roba che ho" <<"," << "scritto nel file!\n"; //scrivo nel file 
	f <<"Seconda riga!";
	
	f.close(); 
	cout<<"Adesso apro il file appena scritto: \n \n"; 
	
	f.open("file.txt", ios::in); //apro lo stesso file che ho creato sopra per ora in lettura! 
	
	while(f.good()) { 
		getline(f, s,','); //preleva una riga dal file 
		cout<<s<<endl; 
	} 
	f.close(); 
	
	return 0;
}