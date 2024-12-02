A=[0,1;
  -3, -4]; %2x2 -> n=2 (ci sono 2 var. di stato)
B=[0;
   1];
C=[2, 1];
D=0;


%1) CALCOLARE K ED L

lambdaK=[-0.7, -0.8];
lambdaL=[-10, -11]; %li voglio a parte reale neg. così che il sist. sia asint. stabile, 
% essi controllano il comportamento durante il transitorio. Voglio che il transitorio sia 
% più breve possibile e che non si allontani troppo dal regime anche se per poco tempo (ricorda esempio retroaz. statica).
% Per diminuire il transitorio devo imporre autoval. a parte reale neg. e in valore assoluto più grande possibile.
% Se li mettiamo troppo grandi si potrebbe verificare quell'elongazione non
% voluta, ma questa cosa non possiamo controllarla.

%verifico raggiungibilità
MR=ctrb(A,B);
rMR=rank(MR); %rMR=n=2 -> sist. compl. ragg.

%verifico osservabilità
MO=obsv(A,C);
rMO=rank(MO); %rMO=n=2 -> sist. compl. osserv.

%calcolo K
K=place(A,B,lambdaK);

%calcolo L
L=place(A',C',lambdaL)';

%2) CALCOLARE ALPHA
ALPHA=inv(-(C-D*K)*inv((A-B*K))*B+D);

%3)SIMULINK
%realizzo progetto del regolatore con plant e osservatore (stimatore), il
%pant è uno state-space con A,B,C e D canoniche, l'osservatore è uno
%state-space con A=A-L*C, B=[B L], C=[1, 0; 0,1] ovvero eye(2) D=[0, 0; 0,0]  ovvero
%zeros(2,2).
% IL PROGETTO SIMULINK è LO SCHEMA DELL'OSSERVATORE RIPORTATO SULLE SLIDE:
% in uscita dell'obsverver c'è un gain con "matrix multiplication" in cui
% inserisco K per avere K*u
%in ingresso al plant c'è uno step con stpe size=0 in ingresso ad un gain
%in cui scrivo alpha "element wise"
%e ad un sommatore che somma questa parte appena descritta con il + e
%l'uscita dell'observer con il -

%OSSERVIAMO CHE è STABILE MA CI IMPIEGA TROPPO AD ARRIVARE A 1, TRANSITORIO
%LENTO.
 
%SE VOLESSIMO FARE LA STESSA COSA MA SENZA SIMULINK:
Acl1=[A-B*K, -B*K;
     zeros(2,2), A-L*C];
Bcl1=[B;
     zeros(2,1)].*ALPHA;
Ccl1=[C-D*K, -D*K];
Dcl1=D.*ALPHA;

S=ss(Acl1, Bcl1, Ccl1, Dcl1);
t=[0:0.01:10];
y_step=step(S,t);
figure(1)
hold on
plot(t,y_step, '.r')
%si stabilizza dopo 9s

%4) CALCOLO K1
lambdaK1=[-10, -12];
K1=place(A,B,lambdaK1);
ALPHA1=inv(-(C-D*K1)*inv((A-B*K1))*B+D);

Acl=[A-B*K1, -B*K1;
     zeros(2,2), A-L*C];
Bcl=[B;
     zeros(2,1)].*ALPHA1;
Ccl=[C-D*K1, -D*K1];
Dcl=D.*ALPHA1;

%CON SIMULINK VEDO CHE C'è UN'ELONGAZIONE INDESIDERATA E POI SI STABILIZZA
%A 1

%SENZA SIMULINK:

S=ss(Acl, Bcl, Ccl, Dcl);
t=[0:0.01:10];
y_step=step(S,t);
figure(1)
hold on
plot(t,y_step, '.b')
%ha un picco anomalo in cui supera il valore 1 e poi si stabilizza, come
%già detto in precedenza, questo è dovuto alla presenza di uno zero, questo
%è il motivo per cui questo metodo non è ottimale.


%5)SIMULINK
%lasciando il k e alpha originali, cambio B solo nell'observer come B*eps

eps=10^(-2/20);

%OSSERVO CHE IL SISTEMA DIVENTA INSTABILE


%6) CALCOLO L1
lambdaL1=[-1000, -1100];
L1=place(A',C',lambdaL1)';
%CON SIMULINK CAMBIAMO SOLO L IN L1 RISPETTO AL CASO 1, MANTENENDO K1 CHE
%ESPLODEVA, NOTIAMO CHE CONTINUA AD ESPLODERE ED è ANCHE PEGGIO



%7) CALCOLO L2
lambdaL2=[-1000, -2];
L2=place(A',C',lambdaL2)';
%CON SIMULINK CAMBIAMO SOLO L IN L2 RISPETTO AL CASO 1, MANTENENDO K1 CHE
%ESPLODEVA, NOTIAMO CHE CONTINUA AD ESPLODERE NELLO STESSO MODO


