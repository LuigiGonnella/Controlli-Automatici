%1
p1 = 0.003;
p2 = 0.025;
p3 = 0.000013; 
V1 = 12;
VG = 126;
n = 5/54; 
Gb = 81;
Ib = 15;


%il sistema non è lin. perchè nelle equaz. dello stato ho G che viene
%moltiplicato per Beta, quindi ho x1*x3 invece che una dipendenza
%dall'ingresso -> non loinearità

%per trovare il punto di eq. pongo x_=0 -> x_=f(x,u) = 0
r_= 16.66667;
L_=0;
u_=[r_,L_]';
%trovo:
x_=[81, 15, 0]';
G=81;
I=15;
Beta=0;

%2
%trovo A=df/dx=[df1/dx1, df1/dx2....
%               df2/dx1, df2/dx2....] , B=df/du (analogo), C=dg/dx (analogo), D=dg/du (analogo) con f(x,u)=x e g(x,u)=y

A = [-p1-Beta, 0, -81; 
    0, -n, 0;
    0, p3, -p2];

B = [0, 1/VG;
    1/V1, 0;
    0, 0];

C = eye(3); %g(x,u)=G, costante = 81, non dipende da x e u

D = zeros(3,2); %g(x,u)=G, costante = 81, non dipende da x e u

%3
%trovo autovalori di A

eig_ = eig(A)

%sono tutti negativi, di conseguenza è ASINTOTICAMENTE STABILE
%se ci fosse stato uno positivo sarebbe stato instabile
%se ci fosse stato uno a parte reale nulla non avremmo potuto concludere
%nulla

%4, 5 e 6 SIMULINK

%7
MR=ctrb(A,B);
r_MR=rank(MR); %r=3=n -> sist compl. ragg. -> sist. compl controll.

%8
MO=obsv(A,C);
r_MO=rank(MO); %r=3=n -> sist compl. oss. 

lambdaK=[-0.3, -2.5, -0.9];
lambdaL=[-3, -25, -9];

K=place(A,B,lambdaK)
L=place(A',C', lambdaL)'
