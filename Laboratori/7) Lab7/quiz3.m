s=tf('s');
A=[1,0,0;0,1,1;0,0,0.1];
B=[0;0];
C=[1,1];
D=0;

% place(A,B,[20,-10]);

% place(A',C',[-20,-10])';

minreal(zpk(inv((s*eye(size(A))-A))))