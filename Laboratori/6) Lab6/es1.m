s=tf('s');
Gp=25/(s^3+3.3*s^2+2*s);
pole(Gp)
Kp=25/2; 
Gs=1;
Ga=0.095;
Gr=1;
Gd=1;
Kd=1;
R0=1;
Da0=5.5*10^-3;
wp=0.02;
ws=40;
ap=2*10^-2;
as=10^-1;

Gf=1/(Kd*Gs);

Kc1=Kd^2*R0/(1.5*10^-1*Kp*Ga);
Kc2=Da0/(Ga*Gs*Gf*1.5*10^-2);

MSLF=5*10^-4/ap;
MSLFdb=20*log10(MSLF);

wl=wp*10^(-MSLFdb/40);

MTHF=5*10^-4*Gs/as;
MTHFdb=20*log10(MTHF);

wh=ws*10^(MTHFdb/40)/2;

tr=3;
ts5=12;
alpha=0.05;

smor=sqrt(log(0.1)^2/(pi^2+log(0.1)^2));
Tp=1/(2*smor*sqrt(1-smor^2));
Tpdb=20*log10(Tp);
Sp=2*smor*sqrt(2+4*smor^2+2*sqrt(1+8*smor^2))/(sqrt(1+8*smor^2)+4*smor^2-1);
Spdb=20*log10(Sp);
wcMIN1=(pi-acos(smor))*sqrt(sqrt(1+4*smor^4)-2*smor^2)/(sqrt(1-smor^2))/tr
wcMIN2=-log(alpha)*sqrt(sqrt(1+4*smor^4)-2*smor^2)/smor/ts5

Kc=5.7;
Gc=Kc;
Lin=minreal(zpk(Gc*Gp*Ga*Gs*Gf));
% figure(1)
% bode(Lin)
% hold on

[numL, denL] = tfdata(Lin, 'v');
% 
% figure(2)
% nyquist1(numL,denL)
% hold on

figure(3)
nichols(Lin)
hold on

figure(3)
myngridst(Tp, Sp)
hold on


wcdes=1;

wnormd=1.4;
zd=wcdes/wnormd;
md=16;
Rd=(1+s/zd)/(1+s/(md*zd));

Gc=Gc*Rd;

figure(3)
nichols(Lin)
hold on

wnormi=100;
pi=wcdes/wnormi;
mi=10^(16.58/20);
Ri=(1+s/(pi*mi))/(1+s/pi);

Gc=Gc*Ri;
Lfin=minreal(zpk(Gc*Gp*Ga*Gs*Gf));

figure(3)
nichols(Lfin)
hold on


T=minreal(zpk(Lfin/(1+Lfin)));
time=[0:tr/100:15];
figure(4)
step(T/(Gf*Gs),time)
hold on

S=minreal(zpk(1/(1+Lfin)));

[mgs,phs]=bode(S,0.02);
mgs
MSLF

[mgt,pht]=bode(T,40);
mgt
MTHF

