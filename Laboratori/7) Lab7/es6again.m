s=tf('s');
Gp=minreal(zpk(40/(s^3+3*s^2+4.5*s)));
pole(Gp);
Kp=40/4.5;
Gs=3;
Ga=-0.27;
Gr=1;
Gd=1;
Da0=8.5*10^-3;
Dp0=3*10^-3;
as=10^-2;
wsm=50;
Kd=3;
R0=1;
Gf=1/(Kd*Gs);

Kc1=abs(Kd^2*R0/(3.5*10^-1*Kp*Ga));
Kc2=abs(Da0/(1.75*10^-2*Ga*Gf*Gs));
Kc3=abs(2*Dp0/(0.375*Kp*Ga*Gs*Gf));

MTHF=3.3*10^-5*Gs/(as);

MTHFdb=20*log10(3.3*10^-5*Gs/(as));
wH=wsm*10^(MTHFdb/40);

tr=2.35;
ts5=8;
alpha=0.05;

smor=sqrt(log(0.09)^2/(pi^2+log(0.09)^2));
Tp=1/(2*smor*sqrt(1-smor^2));
Tpdb=20*log10(Tp);
Sp=2*smor*sqrt(2+4*smor^2+2*sqrt(1+8*smor^2))/(sqrt(1+8*smor^2)+4*smor^2-1);
Spdb=20*log10(Sp);
wcMIN1=(pi-acos(smor))*sqrt(sqrt(1+4*smor^4)-2*smor^2)/(sqrt(1-smor^2))/tr;
wcMIN2=-log(alpha)*sqrt(sqrt(1+4*smor^4)-2*smor^2)/smor/ts5;

Kc=0.025;
Gc=Kc/s;
Lin=minreal(zpk(Gc*Ga*Gp*Gs*Gf));
pole(Lin);

% figure(1)
% bode(Lin)
% hold on

[num,den]=tfdata(Lin,'v');

figure(2)
nyquist1(num,den)
hold on

figure(3)
myngridst(Tp,Sp);
hold on;

figure(3)
nichols(Lin) 
hold on

Wnorm=10;
Wcdes=1;
z=Wcdes/Wnorm;

Rz=1+s/z;
Gc=Gc*Rz;
Lin=minreal(zpk(Gc*Ga*Gp*Gs*Gf));

figure(3)
nichols(Lin) 
hold on

Wnormd=11;
zd=Wcdes/Wnormd;
md=6;
Rd=(1+s/zd)/(1+s/(zd*md));

Gc=Gc*Rd;
Lfin=minreal(zpk(Gc*Ga*Gp*Gs*Gf));

figure(3)
nichols(Lfin) 
hold on

T=Lfin/(1+Lfin);

time=[0:tr/100:10]
figure(4)
step(T/(Gs*Gf), time)
hold on



[mg,ph]=bode(T,wsm);
mg
3.3*10^-5*Gs/(as)




time=[0:tr/100:10];
% figure(4)
% step(T/(Gf*Gs),time)
% hold on