% Prepodavatel v gruppe
% prepodavatel(<prepodavatel>,<gruppa>).
prepodavatel('Shirochin','IV-61').
prepodavatel('Muhin','IV-62').
prepodavatel('Korniichuk','IV-61').
prepodavatel('Korniichuk','IV-62').
prepodavatel('Pavlov','IS-62').
% Gruppa na kafedre
% gruppa(<gruppa>,<kafedra>).
gruppa('IV-61','VT').
gruppa('IV-62','VT').
gruppa('IS-62','ASOIU').

% Prepodavatel v auditoriyah
% auditoriya(<prepodavatel>,<auditoriya>).
auditoriya('Shirochin',514).
auditoriya('Muhin',514).
auditoriya('Korniichuk',221).
auditoriya('Pavlov',307).
%---------------------------------
% Procedures
% Rabotaet li prpodovatel na kafedre
isWork(Prepodovatel,Kafedra) :- prepodavatel(Prepodovatel,G), gruppa(G,Kafedra).
% Prinadlegut li auditoriya kafedre
isBelong(Auditoriya,Kafedra) :- auditoriya(P,Auditoriya), prepodavatel(P,G), gruppa(G,Kafedra).