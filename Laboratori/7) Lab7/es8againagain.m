s=tf('s');
Gp=-30/(s^3+3*s^2+2*s);
pole(Gp);
Kp=-30/2;
Gs=10;
Ga=0.06;
Gd=1;
Gr=1;
Da0=2.5*10^-3;
Dp0=8.5*10^-3;
wsm=40;
Kd=10;
R0=1;

Gf=1/(Kd*Gs);
Kc1=abs(Kd^2*R0/(2.5*10^-1*Kp*Ga));
Kc2=abs(Da0/(10^-2*Ga*Gf*Gs));
Kc3=abs(2*Dp0/(Kp*Ga*Gs*Gf*0.94));

as=5*10^-2;

MTHF=1.6*10^-5*Gs/as;
MTHFdb=20*log10(MTHF);

wH=wsm*10^(MTHFdb/40);

tr=2.5;
ts5=13;
alpha=0.05;

smor=sqrt(log(0.14)^2/(pi^2+log(0.14)^2));
Tp=1/(2*smor*sqrt(1-smor^2));
Tpdb=20*log10(Tp);
Sp=2*smor*sqrt(2+4*smor^2+2*sqrt(1+8*smor^2))/(sqrt(1+8*smor^2)+4*smor^2-1);
Spdb=20*log10(Sp);
wcMIN1=(pi-acos(smor))*sqrt(sqrt(1+4*smor^4)-2*smor^2)/(sqrt(1-smor^2))/tr;
wcMIN2=-log(alpha)*sqrt(sqrt(1+4*smor^4)-2*smor^2)/smor/ts5;

Kc=-0.22;
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

wcdes=0.8;
wnormz=32;
z=wcdes/wnormz;
Rz=1+s/z;

Gc=Gc*Rz;

Lin=minreal(zpk(Gc*Ga*Gp*Gs*Gf));

figure(1)
nichols(Lin)
hold on


wnormd=1.005;
md=5;
zd=wcdes/wnormd;
Rd=(1+s/zd)/(1+s/(md*zd));

Gc=Gc*Rd;

Lfin=minreal(zpk(Gc*Ga*Gp*Gs*Gf));
figure(1)
nichols(Lfin)
hold on

time=[0:tr/100:15];
T=Lfin/(1+Lfin);
figure(2)
step(T/(Gs*Gf),time)
hold on

[mgt,pht] = bode(T,40);
20*log10(mgt)
MTHFdb

% figure(3)
% bodemag(T)
% hold on