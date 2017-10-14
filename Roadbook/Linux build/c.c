#include <iostream>
#include <math.h> 

double delta (double a, double b, double c)
{
double d=0;
d=b*b-4*a*c;
return d;
}

int main()
{
double x, y, z;
double del;   
char sol[]="Le soluzioni sono: ";
 using namespace std;
cout << "Scrivi tre numeri" <<endl;    
cin >> x >> y >> z;
del= delta(x,y,z);
if(del<0){
cout <<"Impossibile" <<endl;
}    
else if(del>0){
double x1, x2;
x1= (-y+sqrt(del))/2;
x2= (-y-sqrt(del))/2;
cout << sol <<x1 <<"," <<x2 <<endl;
}
else{
double x1;
x1= -y/2;
cout << sol <<x1 <<" coincidenti" <<endl;
}
return 0;
}
