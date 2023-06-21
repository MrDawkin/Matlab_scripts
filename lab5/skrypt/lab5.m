clc;
close all;
clear;

%Czesc I
TzewN = -20;
TwewN = 20;
TpN = 10;
qgN = 10000;
a = 0.3;

Kcw = qgN/((TwewN-TzewN)+a*(TwewN-TpN));
Kcwp = a*Kcw;
Kcp = (a*qgN*(TwewN-TpN))/((TpN-TzewN)*((TwewN-TzewN)+a*(TwewN-TpN)));

dlA = 2;
szA = 7;
wyA = 4;
dlB = 2;
szB = 5;
wyB = 3;
Vw = dlA * szA * wyA;
Vp = dlB * szB * wyB;

cp = 1000;
rop = 1.2;
Cvw = cp * rop * Vw;
Cvp = cp * rop * Vp;

%Czesc II
qg0 = qgN;
Tzew0 = TzewN;
Twew0 = (Kcw*Tzew0+Kcwp*TpN+qg0)/(Kcw+Kcwp);
Tp0 = (Kcwp*(Kcw*Tzew0+qg0)+(Kcp*Tzew0)*(Kcw+Kcwp))/(Kcwp*Kcw+Kcp*Kcw+Kcp*Kcwp);

%Czesc III
czas = 50000;
t0 = 1000;
dTzew = 0;
dqg = 0;



%Lab 5
M = [(Cvw*Cvp) (Cvw*Kcwp+Cvw*Kcp+Cvp*Kcw+Cvp*Kcwp) (Kcw*Kcwp+Kcw*Kcp+Kcwp*Kcp)];
M1 = [Cvw (Kcw+Kcwp)];
M2 = [Cvp (Kcwp + Kcp)];
L11 = M2;
L12 = [(Kcw*Cvp) (Kcp*Kcwp+Kcw*Kcwp+Kcw*Kcp)];
L21 = Kcwp;
L22 = [(Kcp*Cvw) (Kcwp*Kcw+Kcw*Kcp+Kcw*Kcp)];


sim("lab55.slx");

subplot(2,1,1);
plot(t,outTwew);
title("Transmitancja Twew");
xlabel("Czas [s]");
ylabel("Temperatura [C]");

subplot(2,1,2);
plot(t,outTp);
title("Transmitancja Tp");
xlabel("Czas [s]");
ylabel("Temperatura [C]");
