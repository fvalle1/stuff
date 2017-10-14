!Risolve equazioni 2grado

Program Equazioni
IMPLICIT none

REAL :: a, b, c, delta, sol1, sol2

a=1
b=1
c=1

WRITE(*,*) "Scrivi a, b e c"
WRITE(*,*) "Dell'equazione ax^2+bx+c=0"

READ (*,*) a, b, c

delta=determinante(a, b, c)

IF (delta==0) THEN
sol1=(-b)/(2*a)
WRITE(*,fmt='(A40,F5.2)') "Le due soluzioni coincidono e valgono:", sol1
STOP
ElSE
IF (delta>0) THEN
!$OMP PARALLEL
sol1=(-b-sqrt(delta))/(2*a)
sol2=(-b+sqrt(delta))/(2*a)
!$OMP END PARALLEL
WRITE(*,fmt='(A25,F5.2,F5.2)') "Le due soluzioni sono:", sol1, sol2
STOP
ELSE
WRITE(*,*) "Equazione impossibile!"
STOP
END IF
END IF

CONTAINS

REAL FUNCTION determinante (p, q, r)
    REAL:: p, q, r
    determinante=(q**2)-((4*p)*r)
END FUNCTION determinante

END PROGRAM
