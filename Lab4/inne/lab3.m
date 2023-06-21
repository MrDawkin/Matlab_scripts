clear all;
clc;
close all

czas_symulacji = 5000;

tzewN = -20;
qgN = 10000;
twewN = 20;
tpN = 10;


a=0.25;
kcw = qgN/((twewN-tzewN)+a*(twewN-tpN));
kcwp = a*kcw;
kcp = (a*qgN*(twewN-tpN))/((tpN-tzewN)*((twewN-tzewN)+a*(twewN-tpN)));

vw=100; %Przykładowe
vp=50; %Przykladowe

cvw=vw*1.2*1000;
cvp=vp*1.2*1000;

%Wartości początkowe
qg0=qgN;
tzew0= tzewN;

twew0=20;
tp0= 10 ;

%Wartości do opóźniania
t0=1000;
dq=0.1*qgN;
dtzew=0;




sim("sim3.slx");

figure();
subplot(2,1,1);
plot(tout, twew);
xlabel("czas t");
ylabel("Twew")
title("Wykres");
subplot(2,1,2);
plot(tout, tp);
xlabel("czas t");
ylabel("Tp");
title("Wykres");
