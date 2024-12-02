s=tf('s');
A=[2,0;0,1];
B=[1;5];
C=[0,1];
D=0;

% sys=ss(A,B,C,D);
% 
% H=tf(sys);
% Y=H*5/s;
% 
% [n,d]=tfdata(Y,'v');
% [R,P]=residue(n,d);
% 
% 2*abs(R(1))
% angle(R(1))

rank(ctrb(A,B))
rank(obsv(A,C))