unit filib;

interface

function maiuscolo(s:string):string;
function minuscolo(s:string):string;
function pari(n:integer):boolean;
function dispari(n:integer):boolean;
function copia(s:string;n,l:integer):string;
function casuale(n:integer):integer;
function radcub(n:real):integer;
function plurale(s:string):string;
procedure rispa(c:char;var t:integer);
procedure rispb(c:char;var t:integer);
procedure rispc(c:char;var t:integer);
procedure rispd(c:char;var t:integer);
procedure suona;
function potenza(x:real;n:integer):real;

implementation

function maiuscolo(s:string):string;
var i:integer;
    s1:string;
    c:char;
begin
  s1:='';
  for i:=1 to length(s) do
    begin
      c:=chr(ord(s[i])-32);
      s1:=s1+c;
    end;
  maiuscolo:=s1;
end;

function minuscolo(s:string):string;
var i:integer;
    s1:string;
    c:char;
begin
  s1:='';
  for i:=1 to length(s) do
    begin
      c:=chr(ord(s[i])+32);
      s1:=s1+c;
    end;
  minuscolo:=s1;
end;

function pari(n:integer):boolean;
begin
  if n<>0 then pari:=(n mod 2=0);
end;

function dispari(n:integer):boolean;
begin
  dispari:=not pari(n);
end;

function copia(s:string;n,l:integer):string;
var s1:string;
begin
  s1:='';
  if length(s) <= (n+l) then
  for n:=n to l do
  s1:=s1+s[n]
  else s1:=s;
  copia:=s1;
end;

function casuale(n:integer):integer;
begin
  randomize;
  casuale:=random(n)+1;
end;

function radcub(n:real):integer;
var r:integer;
begin
  r:=0;
  repeat r:=r+1;
  until  (r*r*r)=n;
  radcub:=r;
end;

function plurale(s:string):string;
var l:integer;
begin
  l:=length(s);
  case s[l] of
  'a' : s:= copia(s,1,l-1)+'e';
  'o' : s:= copia(s,1,l-1)+'i';
  'e' : s:= copia(s,1,l-1)+'i';
  end;
  plurale:=s;
  readln;
end;

procedure rispa(c:char;var t:integer);
begin
 case c of
 'a':begin
      writeln('Bravo..');
      t:=t+1;
      end;
 'b':writeln('Errore');
 'c':writeln('Erratooooooooo');
 'd':writeln('NOOOOoooo!')
 else writeln('NON hai capito niente');
 end;
end;

procedure rispb(c:char;var t:integer);
begin
 case c of
 'b':begin
      writeln('Giusto!!');
      t:=t+1;
      end;
 'a':writeln('Sbagliato');
 'c':writeln('Errato');
 'd':writeln('NOOOOoooo...!')
 else writeln('NON hai capito niente');
 end;
end;

procedure rispc(c:char;var t:integer);
begin
 case c of
 'c':begin
      writeln('Esatto');
      t:=t+1;
      end;
 'b':writeln('No!');
 'a':writeln('Sbagliato!');
 'd':writeln('NO')
 else writeln('NON hai capito niente');
 end;
end;

procedure rispd(c:char;var t:integer);
begin
 case c of
 'd':begin
      writeln('Corretto');
      t:=t+1;
      end;
 'b':writeln('?!?');
 'c':writeln('no!!!');
 'a':writeln('NO')
 else writeln('NON hai capito niente');
end;
end;

procedure suona;
var i:integer;
begin
  for i:=1 to casuale(10) do write(chr(7));
end;

function potenza(x:real;n:integer):real;
var i:integer;
    pot:real;
begin
  pot:=1;
  if (x=0) and (n=0) then pot:=0
    else if n=0 then pot:=1;
  if n>0 then for i:=1 to n do pot:=pot*x;
  if n<0 then pot:=1/potenza(x,-n);
  potenza:=pot;
  end;
end.

