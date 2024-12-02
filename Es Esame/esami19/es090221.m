s=tf('s');
Gp=-1/(0.1*s^2+12.5*s);
pole(Gp);
Kp=-1/12.5;
Gs=5;
Ga=3;
Gd=1;
Gr=1;
Da0=222*10^-2;
as=5*10^-3;

wsm=2500;
Kd=1;

Gf=1/(Kd*Gs);

MTHF=10^(-4)*Gs/as;
MTHFdb=20*log10(MTHF);

wh=wsm*10^(MTHFdb/40);

tr=0.05;
ts5=0.1;
alpha=0.05;

smor=sqrt(log(0.08)^2/(pi^2+log(0.08)^2));
Tp=1/(2*smor*sqrt(1-smor^2));
Tpdb=20*log10(Tp);
Sp=2*smor*sqrt(2+4*smor^2+2*sqrt(1+8*smor^2))/(sqrt(1+8*smor^2)+4*smor^2-1);
Spdb=20*log10(Sp);
wcMIN1=(pi-acos(smor))*sqrt(sqrt(1+4*smor^4)-2*smor^2)/(sqrt(1-smor^2))/tr;
wcMIN2=-log(alpha)*sqrt(sqrt(1+4*smor^4)-2*smor^2)/smor/ts5;

Kc=-10^(40.99/20);
Gc=Kc/s;

Lin=minreal(zpk(Gc*Ga*Gs*Gf*Gp));



figure(1)
nichols(Lin)
hold on

figure(1)
myngridst(Tp,Sp)
hold on

wnormz=100;
wcdes=50;
z=wcdes/wnormz;
Rz=1+s/z;

wnorm=30;
zd=wcdes/wnorm;
md=1;
Rd=(1+s/zd)/(1+s/(md*zd));

Gc=Gc*Rz*Rd;

Lin=minreal(zpk(Gc*Ga*Gp*Gs*Gf));

figure(1)
nichols(Lin)
hold on

T=Lin/(1+Lin);
time=[0:0.05/100:0.15];

figure(2)
step(T/(Gs*Gf),time)
hold on


