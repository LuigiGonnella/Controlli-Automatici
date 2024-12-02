s=tf('s');
Gp=100/(s^2+5.5*s+4.5);
pole(Gp);
zpk(Gp);
Kp=dcgain(Gp); 
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

MSLF=2*10^-3/(16*10^-2);
MSLFdb=20*log10(MSLF);
wl=0.03*10^(-MSLFdb/40);

MTHF=8*10^-4*Gs/(2*10^-1);
MTHFdb=20*log10(MTHF);
wh=60*10^(MTHFdb/40);



smor=sqrt(log(0.12)^2/(pi^2+log(0.12)^2));
Tp=1/(2*smor*sqrt(1-smor^2));
Tpdb=20*log10(Tp);
Sp=2*smor*sqrt(2+4*smor^2+2*sqrt(1+8*smor^2))/(sqrt(1+8*smor^2)+4*smor^2-1);
Spdb=20*log10(Sp);
wcMIN1=(pi-acos(smor))*sqrt(sqrt(1+4*smor^4)-2*smor^2)/(sqrt(1-smor^2))/tr;
wcMIN2=-log(alpha)*sqrt(sqrt(1+4*smor^4)-2*smor^2)/smor/ts5;
Kc=24;
Gc=Kc/s;
Lin=minreal(zpk(Gc*Gp*Ga*Gs*Gf));
% figure(1)
% bode(Lin)
% hold on

[numL, denL] = tfdata(Lin, 'v');

% figure(2)
% nyquist1(numL,denL)
% hold on
% 
figure(3)
nichols(Lin)
hold on

figure(3)
myngridst(Tp, Sp)
hold on

wcdes=1.3;
wnormz=0.9;
z=wcdes/wnormz;
Rz=1+s/z;

Gc=Gc*Rz;

Lin=minreal(zpk(Gc*Gp*Ga*Gs*Gf));

figure(3)
nichols(Lin)
hold on


wnorm=100;
p1=1.3/wnorm;
m1=10^(13.173/20);

Ri=(1+s/(m1*p1))/(1+s/p1);

Gc=Gc*Ri;
Lfin=minreal(zpk(Gc*Gp*Ga*Gs*Gf));

figure(3)
nichols(Lfin)
hold on

T=minreal(zpk(Lfin/(1+Lfin)));
time=[0:tr/100:12];
figure(4)
step(T/(Gf*Gs),time)
hold on
Kd=1;
R0=1;
S=1/(1+Lfin);
T=Lfin/(1+Lfin);
Kd^2*R0/(Kp*Kc*Ga);
[mgs,phs]=bode(S,0.03);
20*log10(mgs)
MSLFdb
[mgt,pht]=bode(T,60);
20*log10(mgt)
MTHFdb

MSLFdb;
MTHFdb;

