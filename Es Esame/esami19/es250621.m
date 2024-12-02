s=tf('s');
Gp=375200/(s^3+575*s^2+70000*s);
pole(Gp);
Kp=375200/70000;
Gs=3;
Ga=6650;
Gd=1;
Gr=1;
Da0=1.5*10^-2;
as=3*10^-1;

wsm=5000;
Kd=3;
R0=1;

Gf=1/(Kd*Gs);

MTHF=10^-2*Gs/as;
MTHFdb=20*log10(MTHF);

wh=wsm*10^(MTHFdb/40);

ts5=0.00648;
alpha=0.05;

smor=sqrt(log(0.11)^2/(pi^2+log(0.11)^2));
Tp=1/(2*smor*sqrt(1-smor^2));
Tpdb=20*log10(Tp);
Sp=2*smor*sqrt(2+4*smor^2+2*sqrt(1+8*smor^2))/(sqrt(1+8*smor^2)+4*smor^2-1);
Spdb=20*log10(Sp);
wcMIN2=-log(alpha)*sqrt(sqrt(1+4*smor^4)-2*smor^2)/smor/ts5;

Kc=1;
Gc=Kc;

Lin=minreal(zpk(Gc*Ga*Gp*Gs*Gf));

figure(1)
nichols(Lin)
hold on

figure(1)
myngridst(Tp,Sp)
hold on


wcdes=600;

wnorm1=4;
md1=16;
zd1=wcdes/wnorm1;

Rd1=(1+s/zd1)/(1+s/(md1*zd1));

Gc=Gc*Rd1;
Lin=minreal(zpk(Gc*Ga*Gp*Gs*Gf));


figure(1)
nichols(Lin)
hold on


wnorm2=1.2;
md2=16;
zd2=wcdes/wnorm2;

Rd2=(1+s/zd2)/(1+s/(md2*zd2));

Gc=Gc*Rd2;
Lin=minreal(zpk(Gc*Ga*Gp*Gs*Gf));


figure(1)
nichols(Lin)
hold on

Kc=10^(-25.66/20);

Gc=Gc*Kc;


Lfin=minreal(zpk(Gc*Ga*Gp*Gs*Gf));


figure(1)
nichols(Lfin)
hold on

T=Lfin/(1+Lfin);
time=[0:0.01/100:0.01];
figure(2)
step(T/(Gf*Gs), time)
hold on

[mgt,pht]=bode(T,5000);

20*log10(mgt)