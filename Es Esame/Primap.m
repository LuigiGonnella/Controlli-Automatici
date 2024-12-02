 s=tf('s');
%    A=[0,-1;3,-2];
%    B=[1;1];
%    C=[1,1];
% D=0;
% 
% l=[20,-10];
% 
% place(A,B,l)

 

A=[0,-1;3,2];
B=[0;0];
C=[1,1];
D=0;

K=[1,0];

K*B


% place(A',C',[-20,-10])'

% sys=ss(A,B,C,D);
% H=tf(sys);
% Y=H*5/s;
% 
% [num,den]=tfdata(Y,'v');
% [R,P]=residue(num,den)
% 2*abs(R(1))
% angle(R(1))


% A=[-1,1;0,2];
% B=[1;0];
% C=[1,0];
% D=0;
% sys=ss(A,B,C,D);
% H=tf(sys);
% eig(H)

% A=[1,0,0;0,1,1;0,0,0.1];
% eig(A)
% minreal(zpk(inv(s*eye(size(A))-A)))

