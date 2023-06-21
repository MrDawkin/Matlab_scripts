clear all;
close all;
clc;

% Czesc I

%Wartosci nominalne
TzewN=-20;
TwewN=20;
TpN=10;
qgN=10000;

%wzory parametry statyczne
z=0.3;
kcw=qgN/(TwewN-TzewN+z*(TwewN-TpN));
kcwp=z*kcw;
kcp=(z*qgN*(TwewN-TpN))/((TpN-TzewN)*((TwewN-TzewN)+z*(TwewN-TpN)));

%Parametry pomieszczenia
a=2; % do ustalenia na zajęciach
b=4; % do ustalenia na zajęciach
c=7; % do ustalenia na zajęciach

%Parametry poddasza
d=2; % do ustalenia na zajęciach
e=5; % do ustalenia na zajęciach
f=3; % do ustalenia na zajęciach

%Objetosc pomieszczenia i poddasza
Vw=a*b*c;
Vp=d*e*f;

%Cieplo wlasciwe powietrza i gestosc
cp=1000; %J/(kg*K)
rop=1.2; %kg/m3

%wzory parametry dynamiczne
Cvw=cp*rop*Vw;
Cvp=cp*rop*Vp;

% Czesc II

%qg0=0.5*qgN;
%Tzew0=TzewN;

%qg0 = 0:0.1*qgN:qgN;
%Tzew = [-20, -5, 5, 20];
%l=length(Tzew);

%Twew0 = (qg0+kcw*Tzew(l)+kcwp*TpN)/(kcw+kcwp);
%Tp0 = ((kcp*Tzew(l))*(kcw+kcwp)+kcwp*(qg0+kcw*Tzew(l)))/(kcwp*kcw+kcp*kcw+kcp*kcwp);

%Tp0 = ((kcp*Tzew0)*(kcw+kcwp)+kcwp*(qg0+kcw*Tzew0))/(kcwp*kcw+kcp*kcw+kcp*kcwp);
%Twew0 = (qg0+kcw*Tzew0+kcwp*Tp0)/(kcw+kcwp);

% Czesc III

%czas_symulacji = 100; %calkowity czas symulacji
%t0=10; %moment wystąpienia skoku
%dTzew=0;
%dqg=0; %skok na wejsciu dla mocy
%[t] = sim('lab5sim');

%figure(1);
%plot(t, Tp)

% Czesc IV - LAB5
qg0 = qgN;
Tzew0=TzewN;
M=[Cvw*Cvp, Cvw*kcwp+Cvw*kcp+Cvp*kcw, kcw*kcwp+kcp*kcw]; %s^2 , s^1, s^0
L11 = [Cvp, kcwp+kcp];
L12 = [Cvp*kcw, kcwp*kcp+kcwp*kcw+kcp*kcw];
L21 = [0, kcwp];
L22 = [Cvw*kcp, kcwp*kcw+kcw*kcp+kcwp*kcp];

Tp0 = ((kcp*Tzew0)*(kcw+kcwp)+kcwp*(qg0+kcw*Tzew0))/(kcwp*kcw+kcp*kcw+kcp*kcwp);
Twew0 = (qg0+kcw*Tzew0+kcwp*Tp0)/(kcw+kcwp);

czas_symulacji = 100; %calkowity czas symulacji
t0=1000; %moment wystąpienia skoku
dTzew=0;
dqg=100; %skok na wejsciu dla mocy

X=[qgN qgN 0.4*qgN];
Y=[TzewN TzewN+dTzew TzewN+dTzew];
[t] = sim('lab5sim');

subplot(2,1,1);
plot(t, Twew);
title("Transmitancja Twew");
xlabel("Czas [s]");
ylabel("Temperatura [C]");
subplot(2,1,2);
plot(t, Tp);
title("Transmitancja Tp");
xlabel("Czas [s]");
ylabel("Temperatura [C]");
