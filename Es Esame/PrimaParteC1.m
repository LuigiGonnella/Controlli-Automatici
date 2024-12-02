s=tf('s');
H=3*(s-1)*(s+4)/((s+1)*(s+2)^2);
U=2/s;
Y=minreal(zpk(H*U));
[numy, deny]=tfdata(Y,'v');
[P,R]=residue(numy, deny);

A=[30,39,51;-52,-59,-49;8,7,-7];
C=[3,8,31];
eig(A);
H=(s-2)*(s+5)/((s+1)*(s+2));
[m,f]=bode(H,2);
(f/180)*pi;

H=-4*(s+1)*(s-5)/((s+2)*(s^2-4*s+5));
U=1/s;
Y=H*U;

M=obsv(A,C);
r=rank(M); %non oss.