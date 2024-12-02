% Parametri Bergam minimal model

P1 = 0.003; %paziente diabetico -- P1 = 0.028 min^-1 paziente ok

P2 = 0.025 % min^-1

P3 = 0.000013% (L/mU)*min^2
p1=P1;
p2=P2;
p3=P3;

V1 = 12; % L

Vg = 126; % dL

n = 5/54; % min^-1

Gb = 81; % mg/dL

Ib = 15; % mU/L

Ub = 16.66667; % mU/min <--u1 di equilibrio

% Matrici linearizzato intorno a Gb, Ib, Ub

A = [-P1 0 -Gb;0 -n 0;0 P3 -P2];

B = [0 1/Vg;1/V1 0;0 0];

C = [1 0 0];

D = [0 0];

% Condizioni iniziali linearizzato

x0lin = [90 0 0]';

% Analisi di raggiungibilità

Mr = ctrb(A,B(:,1));

rangoMr = rank(Mr);

% Retroazione statica dallo stato

K = place(A,B(:,1),eig(A)*100)
