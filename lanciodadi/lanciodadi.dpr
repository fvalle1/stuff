program lnciodadi;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  filib in '..\lib\filib.pas';

var i,n,t,c1,c2,c3,c4,c5,c6:integer;
begin
  writeln('Scrivi il numero dei lanci');
  readln(t);;
  for i:=1 to t do begin
                    n:=casuale(6);
                   case n of
                    1:c1:=c1+1;
                    2:c2:=c2+1;
                    3:c3:=c3+1;
                    4:c4:=c4+1;
                    5:c5:=c5+1;
                    6:c6:=c6+1;
                   end;
                   end;
  writeln('f. ass ':8,' f. rel':8,' f. teor.':8);
  writeln('1',c1:7,c1/t:8:2,1/6:8:2);
  writeln('2',c2:7,c2/t:8:2);
  writeln('3',c3:7,c3/t:8:2);
  writeln('4',c4:7,c4/t:8:2);
  writeln('5',c5:7,c5/t:8:2);
  writeln('6',c6:7,c6/t:8:2);
  readln;
end.
