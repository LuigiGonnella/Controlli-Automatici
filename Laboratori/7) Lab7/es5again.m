s=tf('s');
Gp=25/(s^3+3.3*s^2+2*s);
pole(Gp);
Kp=12.5;
Gs=2;
Ga=0.38;
Gr=1;
Gd=1;
R0=1;
Kd=4;
Da0=5.5*10^-3;
ap=2*10^-2;
as=10^-1;
wpM=0.02;
wsm=40;
tr=2.5;
ts5=5;
elong=0.12;
Gf=1/(Kd*Gs);
Kc1=Kd^2*R0/(1.5*10^-1*Kp*Ga);
Kc2=Da0/(5.8*Ga*Gs*Gf);
alpha=0.05;

MSLFdb=20*log10(3.6*10^-4/ap);
wL=wpM*10^(-MSLFdb/40);

MTHFdb=20*log10(1.25*10^-4*Gs/as);
wH=wsm*10^(MTHFdb/40);

smor=sqrt(log(0.12)^2/(pi^2+log(0.12)^2));
Tp=1/(2*smor*sqrt(1-smor^2));
Tpdb=20*log10(Tp);
Sp=2*smor*sqrt(2+4*smor^2+2*sqrt(1+8*smor^2))/(sqrt(1+8*smor^2)+4*smor^2-1);
Spdb=20*log10(Sp);
wcMIN1=(pi-acos(smor))*sqrt(sqrt(1+4*smor^4)-2*smor^2)/(sqrt(1-smor^2))/tr;
wcMIN2=-log(alpha)*sqrt(sqrt(1+4*smor^4)-2*smor^2)/smor/ts5;

Kc=0.0127;
Gc=Kc/s;

Lin=minreal(zpk(Gc*Ga*Gp*Gf*Gs));
% figure(1)
% bode(Lin)
% hold on
% [num,den]=tfdata(Lin,'v');
% figure(2)
% nyquist1(num,den)
% hold on

figure(3)
myngridst(Tp,Sp)
hold on

figure(3)
nichols(Lin)
hold on

wcdes=0.9;

z=0.9/50;
Rz=1+s/z;
Gc=Gc*Rz;

Lin=minreal(zpk(Gc*Ga*Gp*Gf*Gs));
figure(3)
nichols(Lin)
hold on


zd=wcdes/1.63;
md=5;
Rd=(1+s/zd)/(1+s/(md*zd));

Gc=Gc*Rd;
Lfin=minreal(zpk(Gc*Ga*Gp*Gf*Gs));
figure(3)
nichols(Lfin)
hold on

Tf=minreal(zpk(Lfin/(1+Lfin)));
time=[0:tr/100:40];
figure(4)
step(Tf/(Gf*Gs),time)
hold on

MTHFdb
[mgT,phT]=bode(Tf,40);
20*log10(mgT)

MSLFdb
[mgs,phs]=bode(1/(1+Lfin),0.02);
20*log10(mgs)