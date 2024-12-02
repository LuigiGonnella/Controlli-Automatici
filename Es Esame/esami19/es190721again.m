s=tf('s');
Gp=10/(s*(s+50)^2);
pole(Gp);
Kp=10/2500;
Gs=2;
Ga=-3;
Gd=1;
Gr=1;
Da0=222*10^-2;
as=2*10^-3;

wsm=2000;
Kd=1;
R0=1;

Gf=1/(Kd*Gs);

MTHF=10^-5*Gs/as;
MTHFdb=20*log10(MTHF);

wh=wsm*10^(MTHFdb/40);

tr=0.1;
ts5=1;
alpha=0.05;

smor=sqrt(log(0.10)^2/(pi^2+log(0.10)^2));
Tp=1/(2*smor*sqrt(1-smor^2));
Tpdb=20*log10(Tp);
Sp=2*smor*sqrt(2+4*smor^2+2*sqrt(1+8*smor^2))/(sqrt(1+8*smor^2)+4*smor^2-1);
Spdb=20*log10(Sp);
wcMIN1=(pi-acos(smor))*sqrt(sqrt(1+4*smor^4)-2*smor^2)/(sqrt(1-smor^2))/tr;
wcMIN2=-log(alpha)*sqrt(sqrt(1+4*smor^4)-2*smor^2)/smor/ts5;

Kc=-1;
Gc=Kc/s;

Lin=minreal(zpk(Gc*Ga*Gp*Gs*Gf));

figure(1)
nichols(Lin)
hold on

figure(1)
myngridst(Tp,Sp)
hold on

wcdes=25;

wnormz=100;
z=wcdes/wnormz;
Rz=1+s/z;

Gc=Gc*Rz;

Lin=minreal(zpk(Gc*Ga*Gp*Gs*Gf));

figure(1)
nichols(Lin)
hold on

md=16;
wnormd=0.55;
zd=wcdes/wnormd;

Rd=(1+s/zd)/(1+s/(md*zd));

Gc=Gc*Rd;

% 
% figure(3)
% bodemag(T)
% hold on



Lin=minreal(zpk(Gc*Ga*Gp*Gs*Gf));

figure(1)
nichols(Lin)
hold on

Kc=10^(55.1/20);

Gc=Gc*Kc;

Lfin=minreal(zpk(Gc*Ga*Gp*Gs*Gf));

figure(1)
nichols(Lfin)
hold on

T=Lfin/(1+Lfin);
time=[0:0.1/100:2];

figure(2)
step(T/(Gs*Gf),time)
hold on

MTHFdb
[mgt,pht]=bode(T,2000);
20*log10(mgt)
