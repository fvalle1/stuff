program lotto;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var a,b,c,d,e,f,n1,n2,n3,n4,n5,n6,i,cont:integer;
    bool,bsn: boolean;
    sn,s:string[2];
begin
  writeln('vuoi scrivere i sei numeri? (si o no)');
  readln(sn);
  randomize;
  bsn:= sn='si';
  if bsn then begin
  writeln('scrivi i sei numeri');
  readln(a,b,c,d,e,f);
  cont:=0;
  repeat begin
          for i:=6 downto 1 do n1:=random(90)+1;
          i:=0;
          for i:=6 downto 1 do n2:=random(90)+1;
          i:=0;
          for i:=6 downto 1 do n3:=random(90)+1;
          i:=0;
          for i:=6 downto 1 do n4:=random(90)+1;
          i:=0;
          for i:=6 downto 1 do n5:=random(90)+1;
          i:=0;
          for i:=6 downto 1 do n6:=random(90)+1;
          i:=0;
          bool:=((n1=a) and (n2=b) and (n3=c) and (n4=d) and (n5=e) and (n6=f));
          cont:=cont+1;
         end;
  until bool;
  writeln('dopo ',cont,' tentativi sono usciti i tuoi numeri');
  end
  else begin
          for i:=6 downto 1 do n1:=random(90)+1;
          i:=0;
          for i:=6 downto 1 do n2:=random(90)+1;
          i:=0;
          for i:=6 downto 1 do n3:=random(90)+1;
          i:=0;
          for i:=6 downto 1 do n4:=random(90)+1;
          i:=0;
          for i:=6 downto 1 do n5:=random(90)+1;
          i:=0;
          for i:=6 downto 1 do n6:=random(90)+1;
          i:=0;
          s:=' ';
          writeln(n1,s,n2,s,n3,s,n4,s,n5,s,n6);
       end;
readln;
end.



