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

%qg0 = 0:0.1*qgN:qgN;
%Tzew0 = TzewN;
%Twew0 = (qg0+kcw*Tzew(l)+kcwp*TpN)/(kcw+kcwp);
%Tp0 = ((kcp*Tzew(l))*(kcw+kcwp)+kcwp*(qg0+kcw*Tzew(l)))/(kcwp*kcw+kcp*kcw+kcp*kcwp);

%Tp0 = ((kcp*Tzew0)*(kcw+kcwp)+kcwp*(qg0+kcw*Tzew0))/(kcwp*kcw+kcp*kcw+kcp*kcwp);
%Twew0 = (qg0+kcw*Tzew0+kcwp*Tp0)/(kcw+kcwp);

% Czesc III

qg0 = qgN;
Tzew0=TzewN;
M=[Cvw*Cvp, Cvw*kcwp+Cvw*kcp+Cvp*kcw, kcw*kcwp+kcp*kcw]; %s^2 , s^1, s^0
L11 = [Cvp, kcwp+kcp];
L12 = [Cvp*kcw, kcwp*kcp+kcwp*kcw+kcp*kcw];
L21 = [0, kcwp];
L22 = [Cvw*kcp, kcwp*kcw+kcw*kcp+kcwp*kcp];


%G=k/(Ts+1) * e^-sT0;
Tp0 = ((kcp*Tzew0)*(kcw+kcwp)+kcwp*(qg0+kcw*Tzew0))/(kcwp*kcw+kcp*kcw+kcp*kcwp);
Twew0 = (qg0+kcw*Tzew0+kcwp*Tp0)/(kcw+kcwp);



%Metoda ze styczna
% deltax=max(Twew)-Twew0;
% deltau=dqg;
% k=deltax/deltau;

czas_symulacji = 10000; %calkowity czas symulacji
t0=1000; %moment wystąpienia skoku
dTzew=1;
dqg=0.1*qgN; %skok na wejsciu dla mocy
Kp=1;
Ti=1;

figure(1)
[t] = sim('Lab7_przygotowanie_2.slx');
delta_x=max(Tp)-Tp0;
delta_u=dqg;
k=delta_x/delta_u;
x_1=(28.3*delta_x)/100;
x_2=(63.2*delta_x)/100;
t_1=1200;
t_2=400;
T_2=(1.5*(t_2-t_1)*-1);
T_0=t_2-T_2;

plot(t, Tp);
%Metoda dwupunktowa
figure(2)
deltax=max(Twew)-Twew0;
deltau=dqg;
x1=(28.3*deltax)/100;
x2=(63.2*deltax)/100;
t1=2200;
t2=1200;
T=1.5*(t1-t2);
T0=t2-T;
plot(t, Twew);

delta_x=max(Tp)-Tp0;
delta_u=dqg;
k=delta_x/delta_u;
x_1=(28.3*delta_x)/100;
x_2=(63.2*delta_x)/100;
t_1=1200;
t_2=400;
T_2=1.5*(t_1-t_2);
T_0=t_2-T_2;

Kp=0.9*T/k*T_0;
Ti=3.33*T0;
Ki=Kp/Ti;

subplot(2, 2, 1)
procent_zmiany_qg = 0.8;
zmianaTzew = [-10, -5, 5, 10];
k=length(zmianaTzew);
grid on;
hold on;
for i=1:k
    Tzew0=TzewN+zmianaTzew(i);
    qg0 = qgN;
    Tp0 = ((kcp*Tzew0)*(kcw+kcwp)+kcwp*(qg0+kcw*Tzew0))/(kcwp*kcw+kcp*kcw+kcp*kcwp);
    Twew0 = (qg0+kcw*Tzew0+kcwp*Tp0)/(kcw+kcwp);
    dTzew=1;
    dqg=0.1*qgN;
    [t] = sim('lab6_simulink');
    plot(t, Twew);
end

subplot(2, 2, 2)
procent_zmiany_qg = 0.8;
zmianaTzew = [-10, -5, 5, 10];
k=length(zmianaTzew);
grid on;
hold on;
for i=1:k
    Tzew0=TzewN+zmianaTzew(i);
    qg0 = qgN;
    Tp0 = ((kcp*Tzew0)*(kcw+kcwp)+kcwp*(qg0+kcw*Tzew0))/(kcwp*kcw+kcp*kcw+kcp*kcwp);
    Twew0 = (qg0+kcw*Tzew0+kcwp*Tp0)/(kcw+kcwp);
    dTzew=1;
    dqg=0.1*qgN;
    [t] = sim('lab6_simulink');
    plot(t, Tp);
end

subplot(2,1,1);

plot(t,Twew);
title("Twew");
xlabel("Czas [s]");
ylabel("Temperatura [C]");


subplot(2,1,2);
plot(t,Tp);
title("Tp");
xlabel("Czas [s]");
ylabel("Temperatura [C]");

