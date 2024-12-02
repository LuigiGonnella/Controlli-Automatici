%1
A=[3,-1;2,0];
B=[1;1];
C=[1,1];
D=0;

MR=ctrb(A,B);
r=rank(MR);

%compl. controll. per b div. da a/2

%2

A=[3,2;0,-5];
B=[1;0];
C=[1,1];
D=0;
rank(ctrb(A,B)); % NON SERVE, vedi quaderno
l=[-5,-5];

%3

A=[1,1;0,-2];
B=[1;1];
C=[0,1];
D=0;
sys=ss(A,B,C,D);
H=tf(sys);
eig(H);

%4

A=[0,-12.5;8,0];
B=[4;0];
C=[0,3.1250];
D=0;

s=tf('s');
sys=ss(A,B,C,D);
H=tf(sys);
Y=minreal(zpk(H*5/s));

[numY,denY]=tfdata(Y,'v');
[R, P]=residue(numY,denY);

abs(R(1));
angle(R(1));

%5
A=[-7,0;0,-5];
B=[1;1];
C=[0,3];
D=0;
sys=ss(A,B,C,D);
H=tf(sys);
eig(H); %non bibo stabile, non esiste y a steady state

