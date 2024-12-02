s=tf('s');
A=[0,-1;3,2];
B=[0;0];
C=[1,1];
D=0;


% U=5/s;
% sys=ss(A,B,C,D);
% 
% H=tf(sys);
% 
% Y=H*U;
% 
% [num,den] = tfdata(Y,'v');
% [R,P]=residue(num,den);
% abs(R(1))
% angle(R(1))

Mo=obsv(A,C);
rank(Mo)

L=place(A',C',[-20,-10])';

