s=tf('s');
A=[0,-1;3,-2];
B=[1;1];
C=[1,1];
D=0;
% X0=[6;0];
sys=ss(A,B,C,D);
H=tf(sys);
U=5/s;
% Y=minreal(zpk(C*inv(s*eye(size(A))-A)*X0));
Y=H*U;
[num,den]=tfdata(Y,'v');
[R, P]=residue(num,den)

% K=place(A,B,[20,-10])