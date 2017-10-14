program pigreco
implicit none
integer i, n, j
integer, parameter :: jmax=150 !Numero di calcoli
real :: k(2), o(2), pi, random, c, start, finish, startt, finisht, pimedio(jmax), Tm(jmax)

call cpu_time(startt) !Calcola tempo totale

! c centri, k è il punto

o(1)=0 !origine
o(2)=0
n=100000 !Inizializza numero lanci
c=0 !Inizializza c

open(UNIT=3, FILE="/Volumes/FILIPPO/Fortran/pigreco.csv", STATUS="REPLACE") !Genera file

WRITE(3,fmt='(A21,I10,A6)') "Stima di pigreco in: ", n, " lanci"
WRITE(3,fmt='(A15,A16,A15)') "Valore         ", "  Errore %      ", "Tempo          "

call random_seed !Randomize

DO j=1,jmax
call cpu_time(start)
DO i=1,n !Iniziano i tentativi
call random_number(k(1:2))
IF (distanza(o,k)<1) c=c+1 !verifica dove è il punto e se è il caso incrementa c
END DO

pi=(c/i)*4 !Assegna pigreco

call cpu_time(finish)

WRITE(3,fmt='(F13.11,A1,F7.4,F15.4,A2)') pi, " ", (ABS(pi-3.14159)/3.14159)*100 , ABS(finish-start), " s" !Scrive j righe nel file

tm(j)=finish-start
pimedio(j)=pi

c=0 !Azzera i centri

END DO

!Scrive a schermo il valore medio
WRITE(*,fmt='(A8,F10.8,A1)') "Valore: ", SUM(pimedio)/jmax, ";"
WRITE(*,fmt='(A8,F6.4,A3)') "errore: ", (ABS((SUM(pimedio)/jmax)-3.14159)/3.14159)*100, " %;"
WRITE(*,fmt='(A8,F9.4,A8)') "tempo:  ", ABS(SUM(tm)/jmax), " secondi"

call cpu_time(finisht)

Write(3,fmt='(A17,F15.10,A8)') "Tempo impiegato: ", ABS(finisht-startt), " secondi" !scrive il tempo totalr

CONTAINS

REAL FUNCTION distanza(a,b) !Distanza tra due punti
REAL, DIMENSION (2) :: a, b
distanza=(((a(1)-b(1))**2)+((a(2)-b(2))**2))**0.5
END FUNCTION


END PROGRAM pigreco
