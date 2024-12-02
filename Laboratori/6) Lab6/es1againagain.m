s=tf('s');
Gp=25/(s^3+3.3*s^2+2*s);
Ga=0.095;
Da0=5.5*10^-3;
ap=2*10^-2;
as=10^-1;
wp=0.02;
ws=40;
Gs=1;
Kd=1;

pole(Gp);
Kp=25/2;
Gf=1/(Kd*Gs);

R0=1;


Kc1=abs(Kd^2*R0/(Kp*Ga*1.5*10^-1));
Kc2=abs(Da0/(Gs*Gf*Ga*1.5*10^-2));

MSLF=5*10^-4/ap;
MSLFdb=20*log10(MSLF);
wl=wp*10^(-MSLFdb/40);

MTHF=5*10^-4*Gs/as;
MTHFdb=20*log10(MTHF);
wh=ws*10^(MTHFdb/40);

tr=3;
ts=12;
alpha=0.05;

smorz=abs(log(0.1)/(sqrt(pi^2+(log(0.1)^2))));
Sp=2*smorz*sqrt(2+4*smorz^2+2*sqrt(1+8*smorz^2))/(sqrt(1+8*smorz^2)+4*smorz^2-1);
Tp=1/(2*smorz*sqrt(1-smorz^2));
wtr=(pi-acos(smorz))*sqrt(sqrt(1+4*smorz^4)-2*smorz^2)/(tr*sqrt(1-smorz^2));
wts=(-log(alpha)*sqrt(sqrt(1+4*smorz^4)-2*smorz^2))/(ts*smorz);

Kc=5.65;
Gc=Kc;

Lin=minreal(zpk(Gc*Ga*Gp*Gs*Gf));
% 
% figure(1)
% bode(Lin)
% hold on
% 
% [num,den] = tfdata(Lin,'v');
% figure(2)
% nyquist1(num,den)
% hold on

figure(1)
nichols(Lin)
hold on

figure(1)
myngridst(Tp,Sp)
hold on

wcdes=0.9;
wnormd=1.2;
zd=wcdes/wnormd;
md=16;
Rd=(1+s/zd)/(1+s/(md*zd));

Gc=Gc*Rd;

Lin=minreal(zpk(Gc*Ga*Gp*Gs*Gf));
figure(1)
nichols(Lin)
hold on

wnormi=100;
pi=wcdes/wnormi;
mi=10^(17.2/20);
Ri=(1+s/(mi*pi))/(1+s/(pi));

Gc=Gc*Ri;

Lfin=minreal(zpk(Gc*Ga*Gp*Gs*Gf));
figure(1)
nichols(Lfin)
hold on


time=[0:tr/100:20];
T=Lfin/(1+Lfin);

figure(2)
step(T/(Gf*Gs),time)
hold on


MTHFdb
[mgt,pht]=bode(T,40);
20*log10(mgt)

S=1/(Lfin+1);

MSLFdb
[mgs,phs]=bode(S,0.02);
20*log10(mgs)

0.1/wcdes;