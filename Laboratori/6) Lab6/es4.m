s=tf('s');
Gp=-30/(s^3+3*s^2+2*s);
pole(Gp);
zpk(Gp);
Kp=-15; %da zpk(Gp) ricavo Gp nella forma Kp*(1-s/zi)(...)/(1-s/pi)(...)
Gs=1;
Ga=0.006;
Gr=1;
Gd=1;
Kd=1;
R0=1;
tr=3.5;
ts5=14;
alpha=0.05;

Kc1=Kd^2*R0/(2.5*10^-1*Kp*Ga);
Kc2=2.5*10^-3/(Ga*10^-2);
Kc3=8.5*10^-3/(1.5*10^-3*Kp*Ga);
MT=5*10^-4/(5*10^-2);
MTdb=20*log10(MT);

smor=sqrt(log(0.12)^2/(pi^2+log(0.12)^2));
Tp=1/(2*smor*sqrt(1-smor^2));
Tpdb=20*log10(Tp);
Sp=2*smor*sqrt(2+4*smor^2+2*sqrt(1+8*smor^2))/(sqrt(1+8*smor^2)+4*smor^2-1);
Spdb=20*log10(Sp);
wcMIN1=(pi-acos(smor))*sqrt(sqrt(1+4*smor^4)-2*smor^2)/(sqrt(1-smor^2))/tr;
wcMIN2=-log(alpha)*sqrt(sqrt(1+4*smor^4)-2*smor^2)/smor/ts5;
Kc=-63.5;

Lin=Kc*Gp*Ga;
%figure(1)
%bode(Lin)
%hold on

[numL,denL]=tfdata(Lin,'v');
%figure(2)
%nyquist1(numL,denL);
%hold on



figure(1)
myngridst(Tp,Sp);
hold on

md1=16;
zd1=1.95/1.2;
Rd1=(1+s/(zd1))/(1+s/(md1*zd1));
Lin=Lin*Rd1*Rd1;

p1=1.95/100;
m1=10^(7.4/20);
Ri1=(1+s/(m1*p1))/(1+s/p1);

Lfin=Lin*Ri1/(1+s/40); %polo in ws- per rispettare vincolo su spigolo MT

figure(1)
nichols(Lfin);
hold on

T=minreal(zpk(Lfin/(1+Lfin)));
time=[0:tr/100:15];
figure(2)
step(T,time)
hold on

Tmax=10^-2
[mg,ph]=bode(T,40);
mg

