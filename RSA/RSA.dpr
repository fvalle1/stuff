program RSA;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var i,n,e,d,lettere:integer;
    risposta:char;
    chiaro:string;
    codifica,codificato:array[0..100]of integer;

    function eleva(n:integer; i:integer):integer;
var g:integer;
    p:integer;
begin
p:=1;
if n=0 then p:=0;
if i=0 then p:=1;
if i>0 then for g:=1 to i do p:=p*n;
eleva:=p;
end;
begin
  writeln('Vuoi codificare o decodifacare? scrivi c o d');
  readln(risposta);
  if risposta='c' then begin
                      writeln('Scivi la frase');
                      readln(chiaro);
                      writeln('scrivi la chiave pubblica n,e');
                      readln(n,e);
                      for i:=1 to length(chiaro) do codifica[i]:=ord(chiaro[i]);
                      for i:=1 to length(chiaro) do codifica[i]:=(eleva(codifica[i],e))mod n;
                      for i:=1 to length(chiaro) do codificato[i]:=codifica[i];
                      writeln;
                      writeln(chr(7));
                      for i:=1 to length(chiaro) do writeln(codificato[i]);
                      end;
    if risposta='d' then
                      begin
                      writeln('Quante lettere ha il tuo messaggio?');
                      readln(lettere);
                      writeln('Scrivi i numeri');
                      for i:=1 to lettere do readln(codificato[i]);
                      writeln('Scrivi la tua chiave privata n,d');
                      readln(n,d);
                      for i:=1 to lettere do codifica[i]:=(eleva(codificato[i],d))mod n;
                      for i:=1 to lettere do chiaro[i]:=chr(codifica[i]);
                      for i:=1 to lettere do writeln(chiaro[i]);
                      end;
  readln;
  end.
