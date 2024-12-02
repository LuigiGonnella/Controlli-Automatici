A=[2,0;0,1];
B=[1;5];
C=[0,1];
D=0;
s=tf('s');
U=5/s;
sys=ss(A,B,C,D);
H=tf(sys);
y=minreal(zpk(H*U));

MC=ctrb(A,B);
r=rank(MC)
MO=obsv(A,C);
r=rank(MO)
lambdak=[0.1,0.2];
K=place(A,B,lambdak)