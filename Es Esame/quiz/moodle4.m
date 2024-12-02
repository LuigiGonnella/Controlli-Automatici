A=[2,0;0,1];
B=[1;5];
C=[1,1];
D=0;

s=tf('s');
% sys=ss(A,B,C,D);
% H=tf(sys);
% eig(H);
% Y=minreal(zpk(H*1/s));
% [n,d]=tfdata(Y,'v');
% [R,P]=residue(n,d);

rank(ctrb(A,B))
rank(obsv(A,C))

% 
% place(A',C',[-20,-10])';

