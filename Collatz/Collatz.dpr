program Collatz;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  filib in '..\lib\filib.pas';

var n,i:integer;
begin
  writeln('scrivi un numero ');
  readln(n);
  repeat
  if pari(n) then n:=(n div 2)
  else n:=n*3+1;
  writeln(n:3);
  until n=1;
  readln;
end.
