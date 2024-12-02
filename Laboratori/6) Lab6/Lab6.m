%1
clear all
s=tf('s');

Gp=25/(s^3+3.3*s^2+2*s);
zpk(Gp)
Kp=12.5; %da zpk(Gp) ricavo Gp nella forma Kp*(1-s/zi)(...)/(1-s/pi)(...)
Gs=1;
Ga=0.095;
Gr=1;
Gd=1;
Kd=1;
R0=1;

ro1=1.5*10^-1;
Gf=1/(Kd*Gs);
poles=pole(Gp); %c'è 1 polo in 0 -> p=1
p1=1;
h1=1; %perchè r è una rampa -> grado del segn. polin.
nu1=h1-p1; %perche vogliamo erinf<=1.5*10^-1
beta1=0; %perchè nu+p è div. da 0
Kc1=abs(Kd^2*R0/(ro1*Kp*Ga));

Da0=5.5*10^-3;
ro2=1.5*10^-2;
p2=0; %poli di Ga
h2=0; %grado del disturbo polin.
nu2=h2-p2;%perchè vogliamo erda<1.5*10^-2
beta2=1;
Kc2=abs((Da0)/(Gf*Ga*Gs*ro2)); %da capire
%decido kc=kc1 perchè è il più grande tra i due
%ipotizzo segno + per kc, plotto nyquist di Lin, vedo che N=2=pari quindi 
%stabilizzabile, quindi segno giusto
Gc=Kc1/s^nu1
Lin=Ga*Gs*Gf*Gp*Kc1/s^nu1;
%nichols(Lin)
hold on
%figure(1)
ap=2*10^-2;
as=10^-1;
wpMAX=0.02;
wsMIN=40;
tr=3;
ts5=12;
alpha=0.05;
s_=10;
rop=5*10^-4;
ros=5*10^-4;

smor=sqrt(log(0.1)^2/(pi^2+log(0.1)^2))
Tp=1/(2*smor*sqrt(1-smor^2))
Tpdb=20*log10(Tp)
Sp=2*smor*sqrt(2+4*smor^2+2*sqrt(1+8*smor^2))/(sqrt(1+8*smor^2)+4*smor^2-1)
Spdb=20*log10(Sp)
wcMIN1=(pi-acos(smor))*sqrt(sqrt(1+4*smor^4)-2*smor^2)/(sqrt(1-smor^2))/tr
wcMIN2=-log(alpha)*sqrt(sqrt(1+4*smor^4)-2*smor^2)/smor/ts5

%myngridst(Tp,Sp)
Msdb=20*log10(rop/ap)
MTdb=20*log10(ros*Gs/as)
wH=wsMIN*10^(MTdb/40)
wcMAX=(wH)/2 %unico vincolo sul massimo
wL=wpMAX*10^(-Msdb/40);
wcMIN3=2*wL
wcMIN=wcMIN1; %ovvero il massimo tra i 3 wcMINi

%dai calcoli sul quaderno ottengo:
% rete lead:

wnorm_Rd=1.2;
wcdes=0.8;
zd=wcdes/wnorm_Rd;
md=11;
Rd=(1+s/zd)/(1+s/(md*zd)); %rete LEAD, aumento fase
%aggiorno controllore

Gc=Gc*Rd;
Lin=minreal(zpk(Ga*Gs*Gf*Gp*Gc));
%figure(1)
hold on
%nichols(Lin)

%rete lag
wnorm_Ri=200;
pi=wcdes/wnorm_Ri;
mi=10;
Ri=(1+s/(pi*mi))/(1+s/(pi));

%aggiorno controllore

Gc=Gc*Ri;
Lin=minreal(zpk(Ga*Gs*Gf*Gp*Gc));
%figure(1)
hold on
%nichols(Lin)


%2
s=tf('s');
Gp=40/(s^2+3*s+4.5);
zpk(Gp);
Kp=dcgain(Gp); %da zpk(Gp) ricavo Gp nella forma Kp*(1-s/zi)(...)/(1-s/pi)(...)
%posso usare dcgain solo se non ho poli in 0
Gs=1;
Ga=-0.09;
Gr=1;
Gd=1;
Kd=1;
R0=1;

ro=3.5*10^-1;
Gf=1/(Kd*Gs);
poles=pole(Gp); %ci sono 0 poli in 0 -> p=0
p=0;
h=1; %perchè r è una rampa
nu=h-p; %perche vogliamo erinf<=3.5*10^-1
beta=0; %perchè nu+p è div. da 0
Kc=abs(Kd^2*R0/(ro*Kp*Ga));

%3
s=tf('s');
Gp=100/(s^2+5.5*s+4.5);
poles(Gp)
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

%4
s=tf('s');
Gp=-30/(s^3+3*s^2+2*s);
zpk(Gp);
Kp=-30/2; %da zpk(Gp) ricavo Gp nella forma Kp*(1-s/zi)(...)/(1-s/pi)(...)
Gs=1;
Ga=0.006;
Gr=1;
Gd=1;
Kd=1;
R0=1;

ro=2.5*10^-1;
Gf=1/(Kd*Gs);
poles=pole(Gp); %c'è 1 polo in 0 -> p=1
p=1;
h=1; %perchè r è una rampa
nu=h-p; %perche vogliamo erinf<=2.5*10^-1
beta=0; %perchè nu+p è div. da 0
Kc=abs(Kd^2*R0/(ro*Kp*Ga));

