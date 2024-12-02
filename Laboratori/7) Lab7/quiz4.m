s=tf('s');
A=[-1,1;0,2];
B=[1;0];
C=[1,0];
D=0;

% Y=C*inv(s*eye(size(A))-A)*[6;0];
% [n,d]=tfdata(Y,'v');
% [R,P]=residue(n,d)

% place(A,B,[20,-10])

% minreal(zpk(inv(s*eye(size(A))-A)))

sys=ss(A,B,C,D);
H=tf(sys);
eig(H)