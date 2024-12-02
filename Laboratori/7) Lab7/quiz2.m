s=tf('s');
A=[0,-1;3,-2];
B=[1;1];
C=[1,1];
D=0;

% rank(ctrb(A,B))
% rank(obsv(A,C))

% minreal(zpk(inv(z*eye(size(A))-A)))

% place(A,B,[20,-10])

% x0=[6;0];

H=tf(ss(A,B,C,D));
Y=H*5/s;
[num,den]=tfdata(Y,'v');
[R,P]=residue(num,den)
