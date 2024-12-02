A=[-1,0;0,-2];
B=[1;0];
C=[1,0];
D=0;

s=tf('s');
Y=C*inv(s*eye(size(A))-A)*[6;0];
[n,d]=tfdata(Y,'v');
[R,P]=residue(n,d)

