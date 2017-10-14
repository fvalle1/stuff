program Quiz;

{$APPTYPE CONSOLE}

uses
  SysUtils, filib in '..\lib\filib.pas';

var r:char;
    tot,n,c:integer;
    ris:real;
begin
  writeln('Benvenuto al super quiz');
  writeln('E'' facile scrivi in minuscolo a, b, c o d ');
  writeln('e dopo ogni domanda premi invio');
  writeln('se leggi ''NON hai capito niente'' vuol dire che non hai scritto bene');
  writeln('questo e'' tutto buona fortuna!');
  writeln;
  writeln;
  writeln('Se sei pronto premi invio');
  readln;
  r:=' ';
  tot:=0;
  n:=0;
  c:=casuale(2);
  n:=n+1;
  if c=1 then begin
                writeln('Quanti teoremi ci sono sull''angolo esterno di un triangolo?');
                writeln('a: infiniti, b: 1, c: 2, d: 3');
                readln(r);
                rispc(r,tot);
                readln;
                writeln;
                end;
  if c=2 then begin
                writeln('Quanti anni dura un annoluce?');
                writeln('a: 123456, b: nessuno, c: 300000, d: infiniti');
                readln(r);
                rispb(r,tot);
                readln;
                writeln;
                end;
  c:=casuale(2);
  n:=n+1;
  if c=1 then begin
                writeln('Dove fu presidente Mandela?');
                writeln('a: Azerbraijan, b: Rep.Sudafricana, c: Sudafrica, d: U.S.A.');
                readln(r);
                rispb(r,tot);
                readln;
                writeln;
                end;
  if c=2 then begin
                writeln('Se a=2 allora ''Ciao'' =');
                writeln('a: Ciao, b: 4-10-2-14, c: 14, d: 30');
                readln(r);
                rispd(r,tot);
                readln;
                writeln;
                end;

  c:=casuale(2);
  n:=n+1;
  if c=1 then begin
                writeln('Chi ha scritto i promessi sposi?');
                writeln('a: Dante, b: Manzoni, c: Pirandello, d: Kafka');
                readln(r);
                rispb(r,tot);
                readln;
                writeln;
                end;
  if c=2 then begin
                writeln('Quanti anni dura un lustro?');
                writeln('a: 5, b: 50, c: 500, d: 400');
                readln(r);
                rispa(r,tot);
                readln;
                writeln;
                end;
  c:=casuale(2);
  n:=n+1;
  if c=1 then begin
                writeln('Qul e'' l'' attuale nome del'' Ponto''?');
                writeln('a: Mar di Marmara, b: Mar del Ponto, c: Mar Nero, d: Mar Rosso');
                readln(r);
                rispc(r,tot);
                readln;
                writeln;
                end;
  if c=2 then begin
                writeln('Quante furono le guerre Puniche?');
                writeln('a: 2, b: 3, c: 4, d: 5');
                readln(r);
                rispb(r,tot);
                readln;
                writeln;
                end;
  c:=casuale(2);
  n:=n+1;
  if c=1 then begin
                writeln('Quanto vale pi graco?');
                writeln('a: 3.14, b: ',pi:8,', c: 3.142597237, d: 0.314567324');
                readln(r);
                rispb(r,tot);
                readln;
                writeln;
                end;
  if c=2 then begin
                writeln('Quanto pesa un chilo d''oro (d=1500Kg/m3) a T=567K?');
                writeln('a: 1.00Kg, b: 9.82Kg, c: 9.81N, d: dati insufficienti');
                readln(r);
                rispc(r,tot);
                readln;
                writeln;
                end;
  c:=casuale(2);
  n:=n+1;
  if c=1 then begin
                writeln('Di che colore era il cavallo di Napoleone?');
                writeln('a: Bianco, b: Giallo, c: Blu, d: Verde');
                readln(r);
                rispa(r,tot);
                readln;
                writeln;
                end;
  if c=2 then begin
                writeln('Con che lettera inizia le tastiere francesi?');
                writeln('a: qwerty, b: azerty, c: poiuyt, d: qwertu');
                readln(r);
                rispb(r,tot);
                readln;
                writeln;
                end;

  c:=casuale(2);
  n:=n+1;
  if c=1 then begin
                writeln('Quanti erano i consoli a Roma?');
                writeln('a: 2, b: 5, c: 10, d: 100');
                readln(r);
                rispa(r,tot);
                readln;
                writeln;
                end;
  if c=2 then begin
                writeln('Quante furono le spiagge dello sbarco in normandia?');
                writeln('a: 3, b: 4, c: 5, d: 6');
                readln(r);
                rispc(r,tot);
                readln;
                writeln;
                end;
  c:=casuale(2);
  n:=n+1;
  if c=1 then begin
                writeln('Come si chiamano i ''pulsanti'' della tromba?');
                writeln('a: Pistoni, b: fori, c: note, d: diapason');
                readln(r);
                rispa(r,tot);
                readln;
                writeln;
                end;
  if c=2 then begin
                writeln('Chi ha dipinto la gioconda?');
                writeln('a: Monna Lisa, b: Picasso, c: Leonardo, d: Giotto');
                readln(r);
                rispc(r,tot);
                readln;
                writeln;
                end;
  c:=casuale(2);
  n:=n+1;
  if c=1 then begin
                writeln('Cosa significa ''Who met you at the station?''?');
                writeln('a: Chi hai visto alla stazione?, b: Chi ti ha visto alla stazione?');
                writeln('c: Chi e'' la stazione?, d: K vuoi?');
                readln(r);
                rispb(r,tot);
                readln;
                writeln;
                end;
  if c=2 then begin
                writeln('Qulal e'' il nominativo sing. di ''nemorum''?');
                writeln('a: nemorus, b: nomora, c: nemor, d: nemus');
                readln(r);
                rispd(r,tot);
                readln;
                writeln;
                end;
  c:=casuale(2);
  n:=n+1;
  if c=1 then begin
                writeln('Chi ha vinto i mondiali di calcio nel 2002?');
                writeln('a: Argentina, b: Brasile, c: Italia, d: Francia');
                readln(r);
                rispb(r,tot);
                readln;
                writeln;
                end;
  if c=2 then begin
                writeln('Quanti Gol ha segnato Pele'' nella sua cariera?');
                writeln('a: 1234, b: 126, c: 179, d: 1281');
                readln(r);
                rispd(r,tot);
                readln;
                writeln;
                end;

  c:=casuale(2);
  n:=n+1;
  if c=1 then begin
                writeln('Cosa corrisponde attualmente alla Persia?');
                writeln('a: Rep. of Persia, b: Arabia, c: Iraq, d: Iran');
                readln(r);
                rispd(r,tot);
                readln;
                writeln;
                end;
  if c=2 then begin
                writeln('Come risulta scomposto (a*a+a+1)?');
                writeln('a: a(a+2+1), b: 1, c: (a+1)(a+1), d: impossibile');
                readln(r);
                rispd(r,tot);
                readln;
                writeln;
                end;
  c:=casuale(2);
  n:=n+1;
  if c=1 then begin
                writeln('Cosa significa S.P.Q.R. ?');
                writeln('a: So Pazzi Questi Romani, b: Senatus Populus Qui Regnat');
                writeln('c: Senatus PopulusQue Romanorum, d: Senex PopuliQue Romani');
                readln(r);
                rispc(r,tot);
                readln;
                writeln;
                end;
  if c=2 then begin
                writeln('Quante note si scrivono sul pentagramma?');
                writeln('a: 5, b: 7, c: 9, d: 11');
                readln(r);
                rispc(r,tot);
                readln;
                writeln;
                end;
  c:=casuale(2);
  n:=n+1;
  if c=1 then begin
                writeln('Quanti pixel ha una macchina da 10Mp?');
                writeln('a: 10, b: 1.000.000, c: 10.000.000, d: 12.024.393');
                readln(r);
                rispb(r,tot);
                readln;
                writeln;
                end;
  if c=2 then begin
                writeln('Quanti Km sono 12picometri?');
                writeln('a: 0.000000000000000000012, b: 12000000000000000000, c: 0.00000000000000120, d: infiniti');
                readln(r);
                rispa(r,tot);
                readln;
                writeln;
                end;

  c:=casuale(2);
  n:=n+1;
  if c=1 then begin
                writeln('Cos'' e'' l''ISO in fotografia?');
                writeln('a: l''International Servo Organisation, b: l''apertura del diaframma');
                writeln('c: la sensibilita'' del sensore, d: la durata dello scatto');
                readln(r);
                rispc(r,tot);
                readln;
                writeln;
                end;
  if c=2 then begin
                writeln('Cosa significa D.T.B?');
                writeln('a: Digital Trsmission Biassial, b: Digital Tv Broadcasting');
                writeln('c: DatTi ai Bit, d: Dorimit Tibi Beatus');
                readln(r);
                rispb(r,tot);
                readln;
                writeln;
                end;
  c:=casuale(3);
    n:=n+1;
  if c=1 then begin
                writeln('Come si chiama il centro delle metropoli americane?');
                writeln('a: CFC, b: CBD, c: DTB, d: CDB');
                readln(r);
                rispb(r,tot);
                readln;
                writeln;
                end;
  if c=2 then begin
                writeln('Chi ha dipinto ''I Girasoli''?');
                writeln('a: Picasso, b: Van Ghog, c: Leonardo, d: Giotto');
                readln(r);
                rispb(r,tot);
                readln;
                writeln;
                end;
  if c=3 then begin
                writeln('Qual e'' il simbolo di Parigi?');
                writeln('a: Tur Eifel, b: Tour Eiffel, c: Tour Eifel, d: Tur Eiffel');
                readln(r);
                rispb(r,tot);
                readln;
                writeln;
                end;
  c:=casuale(3);
    n:=n+1;
  if c=1 then begin
                writeln('Come si dice  ''tizio'' in inglese?');
                writeln('a: man, b: tizius, c: tizy, d: guy');
                readln(r);
                rispd(r,tot);
                readln;
                writeln;
                end;
  if c=2 then begin
                writeln('Quanti stati non appartengono all''Onu?');
                writeln('a: 0, b: 1, c: 2, d: 3');
                readln(r);
                rispc(r,tot);
                readln;
                writeln;
                end;
  if c=3 then begin
                writeln('Qual e'' il simbolo di Londra?');
                writeln('a: Big Bnan, b: Bing Beng, c: Big Bang, d: big ban');
                readln(r);
                rispd(r,tot);
                readln;
                writeln;
                end;
  c:=casuale(3);
  n:=n+1;
  if c=1 then begin
                writeln('Quando finira'' il mondo secondo i Maia?');
                writeln('a: 21/21/2012, b: 21/12/2012, c: 12/12/2012, d: 21/12/2021');
                readln(r);
                rispb(r,tot);
                readln;
                writeln;
                end;
  if c=2 then begin
                writeln('Quante domande ti ho fatto compresa questa?');
                writeln('a: ',n+1,' b: ',n,' c: ',n-1,' d: ',2*n);
                readln(r);
                rispb(r,tot);
                readln;
                writeln;
                end;
  if c=3 then begin
                writeln('Quante domande hai fatto giuste?');
                writeln('a: ',tot-1,' b: ',tot+1,' c: ',2*tot,' d: ',tot);
                readln(r);
                rispd(r,tot);
                readln;
                writeln;
                end;
    c:=casuale(4);
    n:=n+1;
  if c=1 then begin
                writeln('Come si dice  ''genitori'' in inglese?');
                writeln('a: parent, b: perents, c: parents, d: parens,is');
                readln(r);
                rispc(r,tot);
                readln;
                writeln;
              end;
  if c=2 then begin
                writeln('Quante stelle ci sono sulla bandiera dell'' UE?');
                writeln('a: 7, b: 13, c: 12, d: 17');
                readln(r);
                rispc(r,tot);
                readln;
                writeln;
                end;
  if c=3 then begin
                writeln('Qual e'' il simbolo di Roma?');
                writeln('a: La Roma, b: Anfiteatro del Colosseo, c: Anfitetro Flavio, d: Colosseo');
                readln(r);
                rispd(r,tot);
                readln;
                writeln;
                end;
  if c=4 then begin
                writeln('Qual e'' il simbolo di Torino?');
                writeln('a: Pascal, b: Mole, c: Mole Antnelliana, d: Torino Fc');
                readln(r);
                rispb(r,tot);
                readln;
                writeln;
                end;
    c:=casuale(2);
  n:=n+1;
  if c=1 then begin
                writeln('Nella frase ''Luigi mangia la mela per degli amici venuti da Milano?'' ''degli amici'' (venuti da Milano) e''');
                writeln('a: soggetto, b: C.P.O., c: vantaggio, d: causa');
                readln(r);
                rispc(r,tot);
                readln;
                writeln;
                end;
  if c=2 then begin
                writeln('Quanti anni dura il doppio di un terzo di una dozzina di semisecoli?');
                writeln('a: 12, b: 60, c: 100, d: 40');
                readln(r);
                rispd(r,tot);
                readln;
                writeln;
                end;
    c:=casuale(4);
    n:=n+1;
  if c=1 then begin
                writeln('Come si dice  ''rompere'' in inglese?');
                writeln('a: break, b: broche, c: broken, d: brek');
                readln(r);
                rispa(r,tot);
                readln;
                writeln;
                end;
  if c=2 then begin
                writeln('Come si chiama questo programma?');
                writeln('a: quiz.exe, b: Quiz.exe, c: quiz, d: Quiz');
                readln(r);
                rispb(r,tot);
                readln;
                writeln;
              end;
  if c=3 then begin
                writeln('Quand e'' la festa della repubblica?');
                writeln('a: 2/6, b: 6/2, c: 1/5, d: 6/1');
                readln(r);
                rispa(r,tot);
                readln;
                writeln;
                end;
  if c=4 then begin
                writeln('Se 3987x=0  x=');
                writeln('a: 0, b: impossibile, c: indeterminata, d: 1');
                readln(r);
                rispa(r,tot);
                readln;
                writeln;
                end;
  c:=casuale(2);
  n:=n+1;
  if c=1 then begin
                writeln('x*x=4 <=> x=2?');
                writeln('a: e''sempre vera, b: e'' falso per x=3, c: e'' vero anche se x=-2, d: falso');
                readln(r);
                rispa(r,tot);
                writeln('quella e'' una proposizione non un equazione quindi era la a. N.d.A.');
                readln;
                writeln;
                end;
  if c=2 then begin
                writeln('(a+b+c) al quadrato =?');
                writeln('a: a2+b2+c2+2ab+2ax+2bc, b: a2+c2+ab+bc+ca+b2, c: a2+2ca+c2+2bc+b2+2ba, d: a3+b3+c3+ab+bc-ca');
                readln(r);
                rispc(r,tot);
                readln;
                writeln;
                end;

  c:=casuale(3);
  n:=n+1;
  if c=1 then begin
                writeln('Chi ha passato il Rubicone in armi?');
                writeln('a: Cesare, b: Hitler, c: Eishenawer, d: Enrico VIII');
                readln(r);
                rispa(r,tot);
                readln;
                writeln;
                end;
  if c=2 then begin
                writeln('Quanti spigoli ha una piramide ettagonale?');
                writeln('a: 12, b: 13, c: 14, d: 15');
                readln(r);
                rispc(r,tot);
                readln;
                writeln;
                end;
  if c=3 then begin
                writeln('Quant e'' la somma degli angoli interni di un ennagono?');
                writeln('a: ',(8-2)*180,', b: ',(3-2)*180,', c: ',(9-2)*180,', d: ',(7-2)*180);
                readln(r);
                rispc(r,tot);
                readln;
                writeln;
                end;
  c:=casuale(2);
  n:=n+1;
  if c=1 then begin
                writeln('Quanto vale lo zero assoluto?');
                writeln('a: 0, b: -273, c: -279, d: -1235469.89');
                readln(r);
                rispb(r,tot);
                readln;
                writeln;
                end;
  if c=2 then begin
                writeln('Se -27x>2-7x allora x=');
                writeln('a: x<1/10, b: x=-7/29, c: x=9/7, d: x=-5/27');
                readln(r);
                rispa(r,tot);
                readln;
                writeln;
                end;

  writeln;
  ris := tot/n*100;
  suona;
  if ris<=100 then if ris = 100 then writeln('Sei un genio le hai azzeccate tutte')
                      else if ris>79 then writeln('Bravo hai azzeccato il ',ris:5:2,'% delle risposte')
                           else if ris>69 then writeln('Abbastanza bene (',ris:5:2,'%)')
                                else if ris>60 then writeln('Sei appena sufficiente (',ris:5:2,'%)')
                                      else if ris>0 then writeln('Insufficiente (',ris:5:2,'%)')
                                            else writeln('NON ne hai fatta giusta neanche una')
  else writeln(r);
  writeln;
  writeln('All Rights Reserved. Filippo');
  readln;
  end.










