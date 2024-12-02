s=tf('s');
Gp=40/(s^2+3*s+4.5);
pole(Gp)
Kp=40/4.5;
Gs=1;
Ga=-0.09;
Gd=1;
Gr=1;
Da0=8.5*10^-3;
Dp0=3*10^-3;
wsm=50;
Kd=1;
R0=1;

Gf=1/(Kd*Gs);
Kc1=abs(Kd^2*R0/(3.5*10^-1*Kp*Ga))
Kc2=abs(Dp0/(10^-3*Kp*Ga*Gf*Gs))

as=10^-2;

MTHF=2*10^-4*Gs/as;
MTHFdb=20*log10(MTHF);

wH=wsm*10^(MTHFdb/40)/2;

tr=2.5;
ts5=10;
alpha=0.05;

smor=sqrt(log(0.08)^2/(pi^2+log(0.08)^2));
Tp=1/(2*smor*sqrt(1-smor^2));
Tpdb=20*log10(Tp);
Sp=2*smor*sqrt(2+4*smor^2+2*sqrt(1+8*smor^2))/(sqrt(1+8*smor^2)+4*smor^2-1);
Spdb=20*log10(Sp);
wcMIN1=(pi-acos(smor))*sqrt(sqrt(1+4*smor^4)-2*smor^2)/(sqrt(1-smor^2))/tr;
wcMIN2=-log(alpha)*sqrt(sqrt(1+4*smor^4)-2*smor^2)/smor/ts5;

Kc=-3.8;
Gc=Kc/s;

Lin=minreal(zpk(Gc*Ga*Gp*Gs*Gf));

% figure(1)
% bode(Lin)
% hold on
% 
% figure(2)
% [num,den]=tfdata(Lin, 'v');
% nyquist1(num,den);
% hold on

figure(1)
nichols(Lin)
hold on

figure(1)
myngridst(Tp,Sp)
hold on

wcdes=1.6;
wnormz=0.85;
z=wcdes/wnormz;
Rz=1+s/z;

Gc=Gc*Rz;

Lin=minreal(zpk(Gc*Ga*Gp*Gs*Gf));

figure(1)
nichols(Lin)
hold on

wnormi=100;
mi=10^(6.74/20);
pi=wcdes/wnormi;
Ri=(1+s/(mi*pi))/(1+s/(pi));

Gc=Gc*Ri;

Lfin=minreal(zpk(Gc*Ga*Gp*Gs*Gf));
figure(1)
nichols(Lfin)
hold on

time=[0:tr/100:15];
T=Lfin/(1+Lfin);
figure(2)
step(T/(Gs*Gf),time)
hold on

[mgt,pht] = bode(T,50);
mgt
MTHF

% figure(3)
% bodemag(T)
% hold on