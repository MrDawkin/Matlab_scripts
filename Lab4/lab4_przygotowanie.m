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

czas_symulacji = 10000; %calkowity czas symulacji
t0=1000; %moment wystąpienia skoku
dTzew=1;
dqg=0.1*qgN; %skok na wejsciu dla mocy


subplot(2, 2, 1)
procent_zmiany_qg = 0.8;
zmianaTzew = [-10, -5, 0, 5, 10];
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
    [t] = sim('lab4_simulink');
    plot(t, Twew, 'DisplayName', 'zmTzew=');
end
plot(t,Twew);
title("Twew(t)");
xlabel("Czas [s]");
ylabel("Temperatura [C]");
legend('zmianaTzew = -10 dla qg = qgN', 'zmianaTzew = -5 dla qg = qgN', 'zmianaTzew = 0 dla qg = qgN', 'zmianaTzew = 5 dla qg = qgN', 'zmianaTzew = 10 dla qg = qgN')

subplot(2, 2, 2)
procent_zmiany_qg = 0.8;
zmianaTzew = [-10, -5, 0, 5, 10];
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
    [t] = sim('lab4_simulink');
    plot(t, Tp);
end
plot(t,Tp);
title("Tp(t)");
xlabel("Czas [s]");
ylabel("Temperatura [C]");
legend('zmianaTzew = -10 dla qg = qgN', 'zmianaTzew = -5 dla qg = qgN', 'zmianaTzew = 0 dla qg = qgN', 'zmianaTzew = 5 dla qg = qgN', 'zmianaTzew = 10 dla qg = qgN')

subplot(2,2,3)
procent_zmiany_qg = 0.8;
zmianaTzew = [-10, -5, 0, 5, 10];
k=length(zmianaTzew);
grid on;
hold on;
for i=1:k
    Tzew0=TzewN+zmianaTzew(i);
    qg0 = qgN*procent_zmiany_qg;
    Tp0 = ((kcp*Tzew0)*(kcw+kcwp)+kcwp*(qg0+kcw*Tzew0))/(kcwp*kcw+kcp*kcw+kcp*kcwp);
    Twew0 = (qg0+kcw*Tzew0+kcwp*Tp0)/(kcw+kcwp);
    dTzew=1;
    dqg=0.1*qgN;
    [t] = sim('lab4_simulink');
    plot(t, Twew);
end
plot(t,Twew);
title("Twew(t)");
xlabel("Czas [s]");
ylabel("Temperatura [C]");
legend('zmianaTzew = -10 dla qg = qgN * procentZmianyQg', 'zmianaTzew = -5 dla qg = qgN * procentZmianyQg', 'zmianaTzew = 0 dla qg = qgN * procentZmianyQg', 'zmianaTzew = 5 dla qg = qgN * procentZmianyQg', 'zmianaTzew = 10 dla qg = qgN * procentZmianyQg')


subplot(2,2,4)
procent_zmiany_qg = 0.8;
zmianaTzew = [-10, -5, 0, 5, 10];
k=length(zmianaTzew);
zmianaqgN = [0.1, 0.3, 0.5, 0.6, 0.8];
s=length(zmianaqgN);
grid on;
hold on;
for i=1:k
    Tzew0=TzewN+zmianaTzew(i);
    qg0 = qgN*procent_zmiany_qg;
    Tp0 = ((kcp*Tzew0)*(kcw+kcwp)+kcwp*(qg0+kcw*Tzew0))/(kcwp*kcw+kcp*kcw+kcp*kcwp);
    Twew0 = (qg0+kcw*Tzew0+kcwp*Tp0)/(kcw+kcwp);
    dTzew=1;
    dqg=0.1*qgN;
    [t] = sim('lab4_simulink');
    plot(t, Tp);
end
plot(t,Tp);
title("Tp(t)");
xlabel("Czas [s]");
ylabel("Temperatura [C]");
legend('zmianaTzew = -10 dla qg = qgN * procentZmianyQg', 'zmianaTzew = -5 dla qg = qgN * procentZmianyQg', 'zmianaTzew = 0 dla qg = qgN * procentZmianyQg', 'zmianaTzew = 5 dla qg = qgN * procentZmianyQg', 'zmianaTzew = 10 dla qg = qgN * procentZmianyQg')


