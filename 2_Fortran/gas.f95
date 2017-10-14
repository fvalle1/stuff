Program gas
IMPLICIT none
Real ::  random, y, c, vi, vf, k(2), h, fk
Integer ::  i, n, T
Real, parameter :: R=8.314 !Costante dei gas

n=15 !moli
T=273.15 !Temperatura
vi=50 !Volume iniziale
vf=200 !Volume finale
c=0    !Centri
call Random_seed !Randomize

Do i=1,1000000
call random_number(random)
k(1)=random*ABS(vf-vi)+vi !assegna la x di k

call random_number(random)

SELECT CASE(f(vf)>f(vi)) !assegna la y di k al massimo superiore a 5 dal punto più alto
CASE (.true.)
 fk=random*(f(vf)+5)
 h=f(vf)+5
CASE (.false.)
 fk=random*(f(vi)+5)
 h=f(vi)+5
CASE default 
fk=50
END SELECT

k(2)=fk !Assegna la y del punto

y=f(k(1))

IF (k(2)<y) c=c+1 !Verifica se il punto è sotto la funzione

END DO

WRITE(*,fmt='(F20.4,A1,F20.4)') (c/i)*ABS(vf-vi)*h, " ", n*R*T*log(vf/vi)

STOP

CONTAINS

REAL FUNCTION f(x) !Trova la f(x)
REAL :: x
f=(n*R*T)/x
END FUNCTION f
END PROGRAM gas