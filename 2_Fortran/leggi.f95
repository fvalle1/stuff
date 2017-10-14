PROGRAM leggi
IMPLICIT none

integer:: i
integer, dimension(1:10) :: numero
real, dimension (1:10) :: teta, phi, tetarad, phirad
real, parameter :: pi=4*atan(1.)
Character*7 :: t, f

open (unit=1, FILE='/Volumes/FILIPPO/Fortran/dir.csv', STATUS='OLD')


!$OMP PARALLEL DO
DO i=1,10
READ (1,fmt='(I10,A9,F7.4,A6,F8.4)') numero(i), t, teta(i), f, phi(i)
END DO
!$OMP END PARALLEL DO

DO i=1,10
WRITE (*,fmt='(I10,A9,F8.4,A6,F8.4)') numero(i), t, teta(i), f, phi(i)
END DO

open(Unit=2, File='/Volumes/FILIPPO/Fortran/rad.csv', STATUS='REPLACE')

DO i=1,10
tetarad(i) = gradtorad(teta(i))
phirad(i) = gradtorad(phi(i))
WRITE (2,fmt='(I10,A9,F6.4,A6,F6.4)') numero(i), t, tetarad(i), f, phirad(i)
END DO


STOP

CONTAINS

REAL FUNCTION gradtorad(grad)
REAL :: grad
gradtorad=(grad*(2*pi))/360
END FUNCTION


END PROGRAM leggi