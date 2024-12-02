%1)
%STABILITà INTERNA
A = [0, -1, 5; 0, 0, 3; 0, 0, -2];
B = [1, 1, 1]';
C = [0, 0, 5];
lamda = eig(A); % calcolo autovalori
s = tf('s');
A1 = minreal(zpk(inv(s*eye(size(A))-A))); %calcolo matrice (sI-A)^-1

%il sistema non stabile perchè l'autovalore nullo compare con molteplicità
%2 nel polinomio minimo

%STABILITà BIBO
H = minreal(zpk(C*inv(s*eye(size(A))-A)*B)); %calcolo funzione di trasf.
poles_H = pole(H); %calcolo poli

%il sistema è stabile BIBO perchè H ha tutti i poli con parte reale
%negativa

%2) con matlab
S = ss(A,B,C,0); %sistema
t = [0:0.1:10]; %tempi
y_step = step(9*S,t); %calcolo risposta forzata
figure(1)
hold on
grid
plot(t,y_step,'r')

%2) analiticamente
U = 9/s; %definisco trasformata ingresso
H = minreal(zpk(C*inv(s*eye(size(A))-A)*B)); %calcolo funz. di trasf (METODO 1)
H1 = tf(S); %calcolo funz. di trasf (METODO 2 -> forma rapporto polinomi)
H2 = zpk(S); %calcolo funz. di trasf (METODO 3 -> forma fattorizzata zeri, poli)
Y = minreal(zpk(H*U)); %calcolo trasf. uscita

%SCOMPOSIZIONE IN FRATTI SEMPLICI

[numY, denY] = tfdata(Y, 'v'); %num e den come vettori di coefficienti
[R,P] = residue(numY, denY); %calcolo residui e poli per ottenere la scomposizione
%la scomposizione è: Y(s) = -22.5/(s+2)  + 22.5/s, dunque
%l'antitrasformata, dalle tabelle, è:
t1 = [0:0.01:3]; %tempi
%y(t) = -22.5*exp(-2*t1)+22.5; %per epsilon(t), ma su matlab non lo scriviamo
figure(4)
y2_numerica = step(9*S,t1);
plot(t1, y2_numerica, 'r');
hold on %mantieni e plotta il prossimo senza cancellare
y2_analitica = -22.5*exp(-2*t1)+22.5;
plot(t1, y2_analitica, 'r');
grid



%3) e 4) con matlab
x_1 = [1, 5, 0]';
x_2 = [0, 0, 3]';

y1_libera = initial(S,x_1,t); %risosta libera 1, nulla perchè si deduce dalla matrice C 
% da cui capiamo che l'uscita libera è 5*x3 (perchè x3 non dipende da x1 e x2, 
% ciò lo deduciamo dall'ultima riga della matrice A, c'è solo -2 dunque non dipende da altri termini)
%figure(2)
%hold on
%grid
%plot(t,y1_libera,'r')

y2_libera = initial(S,x_2,t); %risposta libera 2
%figure(3)
%hold on
%grid
%plot(t,y2_libera,'r')

%3) analiticamente
x0 = [1 5 0]';
figure(5)
yl1_n = initial(S,x0,t); %uscita libera numerica
plot(t1, yl1_n, 'r');
hold on %mantieni e plotta il prossimo senza cancellare
YL1 = minreal(zpk(C*inv(s*eye(size(A))-A)*x0)) %uscita libera analitica
plot(t1, YL1, 'r');
grid


%YL1=0 --> yl1(t) = 0

%4) analiticamente
x0 = [0 0 3]';
figure(6)
yl2_n = initial(S,x0,t); %uscita libera numerica
plot(t1, yl2_n, 'r');
hold on %mantieni e plotta il prossimo senza cancellare
YL2 = minreal(zpk(C*inv(s*eye(size(A))-A)*x0)) %uscita libera analitica
plot(t1, YL2, 'r');
grid


%YL2=15/(s+2) --> yl2(t) = 15*exp(-2t);

%5)


