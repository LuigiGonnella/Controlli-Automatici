%1
m = 0.02;
g = 9.81;
Kt = 708.27; 
Km = 1.52 * 10^(-4);
Im0 = 0.8;
Im=Im0;



%il sistema non è lin. perchè nelle equaz. dello stato ho x1^2 quindi una dipendenza
%dall'ingresso -> non linearità

%per trovare il punto di eq. pongo le x_=0 -> x_=f(x,u) = 0 e la y=0 ->
%g(x,u)=0
Xb= 0.8;

%trovo:
x_= 0.022;
x1 = 0.022;
x2 = 0;

%2
%trovo A=df/dx=[df1/dx1, df1/dx2....
%               df2/dx1, df2/dx2....] dove le f sono le funzioni delle variabili di stato x, B=df/du (analogo), C=dg/dx (analogo), D=dg/du (analogo) con f(x,u)=x e g(x,u)=y

A = [0, 1; 
    (2*Km*Im^2)/(m*x1^3), 0;
    ];

B = [0;
    -(2*Km*Im)/(m*x1^2);
    ];

C = [Kt, 0]; 

D = 0; 

%3
%trovo autovalori di A

eigA = eig(A)

%c'è un autovalore positivo quindi il sistema non è stabile

%4 e 5 SIMULINK

%6
MR=ctrb(A,B);
r_MR=rank(MR); %r=2=n -> sist. compl, ragg. -> sist. compl controll.

%7
lambdaK=[-20, -30];


K=place(A,B,lambdaK)

ALPHA=inv(-(C-D*K)*inv((A-B*K))*B+D)



%8 SIMULINK

%9

MO=obsv(A,C);
r_MO=rank(MO); %r=2=n -> sist. compl. oss.

%10
lambdaL=[-100, -77];
L=place(A',C',lambdaL)'


%11 SIMULINK

