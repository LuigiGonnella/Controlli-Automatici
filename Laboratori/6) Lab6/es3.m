s=tf('s');
Gp=100/(s^2+5.5*s+4.5);
pole(Gp)
zpk(Gp);
Kp=100/4.5; %da zpk(Gp) ricavo Gp nella forma Kp*(1-s/zi)(...)/(1-s/pi)(...)
Gs=1;
Ga=0.014;
Gr=1;
Gd=1;
Kd=1;
R0=1;

ro=1.5*10^-1;
Gf=1/(Kd*Gs);
poles=pole(Gp); %ci sono 0 poli in 0 -> p=0
p=0;
h=1; %perchè r è una rampa
nu=h-p; %perche vogliamo erinf<=1.5*10^-1
beta=0; %perchè nu+p è div. da 0
Kc=abs(Kd^2*R0/(ro*Kp*Ga));
tr=2;
ts5=8;
alpha=0.05;

smor=sqrt(log(0.12)^2/(pi^2+log(0.12)^2));
Tp=1/(2*smor*sqrt(1-smor^2));
Tpdb=20*log10(Tp);
Sp=2*smor*sqrt(2+4*smor^2+2*sqrt(1+8*smor^2))/(sqrt(1+8*smor^2)+4*smor^2-1);
Spdb=20*log10(Sp);
wcMIN1=(pi-acos(smor))*sqrt(sqrt(1+4*smor^4)-2*smor^2)/(sqrt(1-smor^2))/tr;
wcMIN2=-log(alpha)*sqrt(sqrt(1+4*smor^4)-2*smor^2)/smor/ts5;
Kc=21.5;
Gc=Kc/s;
Lin=minreal(zpk(Gc*Gp*Ga*Gs*Gf));
figure(1)
bode(Lin)
hold on

[numL, denL] = tfdata(Lin, 'v');

figure(2)
nyquist1(numL,denL)
hold on

figure(3)
nichols(Lin)
hold on

figure(3)
myngridst(Tp, Sp)
hold on

z=1.27;
Rz=1+s/z;

wnorm=100;
p1=1.4/wnorm;
m1=10^(11.45/20);

Ri=(1+s/(m1*p1))/(1+s/p1);

Gc=Gc*Rz*Ri;
Lfin=minreal(zpk(Gc*Gp*Ga*Gs*Gf));

figure(3)
nichols(Lfin)
hold on

T=minreal(zpk(Lfin/(1+Lfin)));
time=[0:tr/100:10];
figure(4)
step(T/(Gf*Gs),time)
Kd=1;
R0=1;
S=1/(1+Lfin);
T=Lfin/(1+Lfin);
Kd^2*R0/(Kp*Kc*Ga);
[mgs,phs]=bode(S,0.03);
16*10^-2*mgs;
[mgt,pht]=bode(T,60);
mgt*2*10^-1;

