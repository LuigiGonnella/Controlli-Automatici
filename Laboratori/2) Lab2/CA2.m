%1
s = tf('s');
H1 = minreal(zpk(1 / (s*(s+2)*(s+4))));

%figure(1)
%bode(H1)
grid

%figure(2)
%nyquist(H1)

%2
H2 = minreal(zpk((-0.1*(1-2*s)) / (s*(s+0.2)*(s+1))));

%figure(1)
%bode(H2)
grid

%figure(2)
%nyquist(H2)

%3
H3 = minreal(zpk(1 / ((s^2)*(s+3))));

%figure(1)
%bode(H3)
grid

%figure(2)
%nyquist(H3)

%4
H4 = minreal(zpk((2*(1+0.5*s)) / ((1+s)*(1-s)^2)))

%figure(1)
%bode(H4)
grid

%figure(2)
%nyquist(H4)

%5
H5 = minreal(zpk((s^2+1) / ((-2+s)*(2+s)*(s+4))));

%figure(1)
%bode(H5)
grid

%figure(2)
%nyquist(H5)

%6
H6 = minreal(zpk(0.125*(s^2+1) / (s*(1+0.25*s)*(1+0.5*s))));

%figure(1)
%bode(H6)
grid

%figure(2)
%nyquist(H6)

%7
H7 = minreal(zpk((s-2) / ((2+s)*(1+s^2))));

%figure(1)
%bode(H7)
grid

%figure(2)
%nyquist(H7)

%8
H8 = minreal(zpk(0.25 / ((s)*(1-0.5*s)^2)));

%figure(1)
%bode(H8)
grid

%figure(2)
%nyquist1(H8)


s = tf('s');
H = (s-2)/((s+2)*(s^2+1));
[numH,denH]=tfdata(H,'v');
% tfdata(H, 'v') -> restituisce i ciò che serve
% come input della funzione Nyquist1 che visualizza i diagrammi di Nyquist
% ma BELLI

%[re, im] = nyquist(H);
%figure, plot(squeeze(re), squeeze(im))
%H1 = minreal(zpk(H));
%figure  
%nyquist(H1)
%figure 
%bode(H1)
%bode(H1, logspace(-2, 3, 10));
%grid on
%logspace(l'esponente!! del primo valore, esponente ultimo valore, numero di punti)

%figure 
%nyquist1(numH, denH) %diagramma di nyquist

%9
H=minreal(zpk(1/((s^2+1)*(s+2))));
[numH,denH]=tfdata(H,'v');

%figure(1)
%bode(H)

%figure(2)
%nyquist1(numH, denH)

%10
H=minreal(zpk(-(1-s)/((s^2+1)*s)))
[numH,denH]=tfdata(H,'v');

%figure(1)
%bode(H)

%figure(2)
%nyquist1(numH, denH)

%11
H=minreal(zpk((1+s)/((s^2+4*s+5)*(s+2))))
[numH,denH]=tfdata(H,'v');
roots(denH)

%figure(1)
%bode(H)

%figure(2)
%nyquist1(numH, denH)



%12
H=minreal(zpk((3+s)*(s^2+2*s+2)/(s*(s+2)*(s-1)*(s+4))))
[numH,denH]=tfdata(H,'v');
roots(numH)

%figure(1)
%bode(H)

%figure(2)
%nyquist1(numH, denH)

%13
H=minreal(zpk(1/(2*s^3)))
[numH,denH]=tfdata(H,'v');

%figure(1)
%bode(H)

%figure(2)
%nyquist1(numH, denH)

%14
H=minreal(zpk((s^3+4*s^2+7*s+6)/(s^4+5*s^3+10*s^2+11*s+3)))
[numH,denH]=tfdata(H,'v');
roots(numH)
roots(denH)

%figure(1)
%bode(H)

%figure(2)
%nyquist1(numH, denH)

%15
H=minreal(zpk((s^2-1)/(s^3+s^2+s-3)))
[numH,denH]=tfdata(H,'v');
roots(denH)

figure(1)
bode(H)

figure(2)
nyquist1(numH, denH)