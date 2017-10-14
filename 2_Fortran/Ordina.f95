PROGRAM ordina
IMPLICIT none

INTEGER :: max=5
INTEGER, DIMENSION (1:5) :: a, b, ordinato, backup
INTEGER :: l, k, o, p, massimo, minimo

a(1)=1   !Assegna valori x test
a(2)=2
a(3)=3
a(4)=4
a(5)=5

WRITE(*,*) "Inserisci il vettore da ordinare"

DO k=1,max     !Legge i valori
READ(*,*) a(k)
END DO


DO k=1,max      !copia a in backup
backup(k)=a(k)
END DO

o=1 !Inizializza ordinato

DO l=1,max !Controlla tutto l'array
massimo=a(1)  !Trova massimo

DO k=2,max
IF (a(k)>massimo) THEN 
massimo=a(k) 
END IF
END DO !Fine massimo

minimo=a(1)  !Trova minimo

DO k=2,max
IF (a(k)<minimo) THEN 
minimo=a(k) 
END IF
END DO !Fine minimo

DO k=1,max
IF (a(k)==massimo) THEN
ordinato(o)=massimo
o=o+1
a(k)=minimo !Sostituisce al massimo il minimo
END IF
END DO 

END DO
WRITE (*,*) "Il vettore ordinato e':", ordinato(1:max) 

STOP

END PROGRAM
