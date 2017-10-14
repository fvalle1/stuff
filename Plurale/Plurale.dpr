program Plur;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  filib in '..\lib\filib.pas';

var s:string;
begin
    writeln('scrivi una parola singolare');
    readln(s);
    writeln(plurale(s));
    readln;
end.