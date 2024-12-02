s=tf('s');
% z=tf('z');
A=[3,0;0,0.7];
B=[1;1];
C=[0,3];
D=0;

sys=ss(A,B,C,D);
H=tf(sys);
Y=H*1/s;

figure(1)
step(sys)
 
 
%-C*inv(A)*B

% A=[-1,0;0,-2];
% B=[1;0];
% C=[1,0];
% D=0;
% x0=[6;0];
% Y=C*inv(s*eye(size(A))-A)*x0


% rank(ctrb(A,B))
% rank(obsv(A,C))



% sys=ss(A,B,C,D);
% H=tf(sys);
% U=5/s;
% 
% Y=U*H;
% [n,d]=tfdata(Y,'v');
% [R,P]=residue(n,d)
% 
% 2*abs(R(1))
% angle(R(1))