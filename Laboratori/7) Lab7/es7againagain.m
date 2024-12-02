s=tf('s');
Gp=100/(s^3+5.5*s^2+4.5*s);
pole(Gp);
Kp=dcgain(s*Gp);
Gs=0.5;
Ga=0.112;
Gd=1;
Gr=1;
Da0=1.5*10^-3;
wpM=0.03;
wsm=60;
Kd=8;
R0=1;

Gf=1/(Kd*Gs);
Kc1=abs(Kd^2*R0/(1.5*10^-1*Kp*Ga));
Kc2=abs(Da0/(2.14*Ga*Gf*Gs));

ap=16*10^-2;
as=2*10^-1;

MSLF=5.1*10^-3/(ap);
MSLFdb=20*log10(MSLF);

wl=wpM*10^(-MSLFdb/40);

MTHF=1.6*10^-3*Gs/(as);
MTHFdb=20*log10(MTHF);

wh=wsm*10^(MTHFdb/40)/2;


tr=1.8;
ts5=6;
alpha=0.05;

smor=sqrt(log(0.12)^2/(pi^2+log(0.12)^2));
Tp=1/(2*smor*sqrt(1-smor^2));
Tpdb=20*log10(Tp);
Sp=2*smor*sqrt(2+4*smor^2+2*sqrt(1+8*smor^2))/(sqrt(1+8*smor^2)+4*smor^2-1);
Spdb=20*log10(Sp);
wcMIN1=(pi-acos(smor))*sqrt(sqrt(1+4*smor^4)-2*smor^2)/(sqrt(1-smor^2))/tr;
wcMIN2=-log(alpha)*sqrt(sqrt(1+4*smor^4)-2*smor^2)/smor/ts5;

Kc=0.055;
Gc=Kc/s;
Lin=minreal(zpk(Gp*Gc*Ga*Gf*Gs));
figure(1)
nichols(Lin);
hold on

figure(1)
myngridst(Tp,Sp);
hold on

wcdes=1.4;
wnormz=100;
z=wcdes/wnormz;



Rz=1+s/z;
Gc=Rz*Kc/s;
Lin=minreal(zpk(Gp*Gc*Ga*Gf*Gs));
figure(1)
nichols(Lin);
hold on

md=5;
wnormd=1.98;
zd=wcdes/wnormd;
Rd=(1+s/zd)/(1+s/(md*zd));

Gc=(Rd*Rz*Kc)/s;
Lfin=minreal(zpk(Gp*Gc*Ga*Gf*Gs));

figure(1)
nichols(Lfin);
hold on

time=[0:tr/100:10];
T=Lfin/(1+Lfin);

figure(2)
step(T/(Gf*Gs),time)
hold on

S=1/(1+Lfin);


[mgs,phs] = bode(S,0.03);
20*log10(mgs);
MSLFdb;

[mgt,pht]= bode(T,60);
20*log10(mgt);
MTHFdb;
