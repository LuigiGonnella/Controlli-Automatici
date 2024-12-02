s=tf('s');
Gp=40/(s^2+3*s+4.5);
Gs=1;
Ga=-0.09;
Da0=8.5*10^-3;
Dp0=3*10^-3;
as=10^-2;
ws=50;
R0=1;
Kd=1;
tr=2.5;
alpha=0.05;
ts=10;
el=0.08;

pole(Gp);
Gf=1/(Kd*Gs);
Kp=40/4.5;

Kc1=abs(Kd^2*R0/(Kp*Ga*3.5*10^-1));
Kc2=abs(Dp0/(Kp*Ga*Gs*Gf*10^-3));

MTHF=2*10^-4*Gs/as;
MTHFdb=20*log10(MTHF)

wh=ws*10^(MTHFdb/40)/2;
smorz=abs(log(el)/(sqrt(pi^2+(log(el))^2)));
Tp=1/(2*smorz*sqrt(1-smorz^2));
Sp=2*smorz*sqrt(2+4*smorz^2+2*sqrt(1+8*smorz^2))/(sqrt(1+8*smorz^2)+4*smorz^2-1);
wtr=(pi-acos(smorz))*sqrt(sqrt(1+4*smorz^4)-2*smorz^2)/(tr*sqrt(1-smorz^2));
wts=-log(alpha)*sqrt(sqrt(1+4*smorz^4)-2*smorz^2)/(ts*smorz);
Kc=-3.8;

Gc=Kc/s;
Lin=minreal(zpk(Gc*Ga*Gp*Gs*Gf));
pole(Lin);

% figure(1)
% bode(Lin)
% hold on

% [n,d]=tfdata(Lin,'v');
% figure(1)
% nyquist1(n,d)
% hold on


figure(1)
myngridst(Tp,Sp)
nichols(Lin)
hold on

wcdes=1.15;

wnormz=0.45;
z=wcdes/wnormz;
Rz=1+s/z;

Gc=Gc*Rz;
Lin=minreal(zpk(Gc*Ga*Gp*Gs*Gf));

figure(1)
nichols(Lin)
hold on

wnormi=100;
pi=wcdes/wnormi;
mi=10^(8.88/20);
Ri=(1+s/(mi*pi))/(1+s/pi);

Gc=Gc*Ri;
Lfin=minreal(zpk(Gc*Ga*Gp*Gs*Gf));

figure(1)
nichols(Lfin)
hold on

T=Lfin/(1+Lfin);
time=[0:tr/100:20];

figure(2)
step(T/(Gs*Gf),time)
hold on

[mg,pj]=bode(T,50);
20*log10(mg)

figure(3)
bodemag(T)
hold on