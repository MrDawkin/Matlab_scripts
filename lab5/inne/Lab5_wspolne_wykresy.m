clear;
clc;
close all;

%Czesc I

TzewN = -20;
TwewN = 20;
TpN = 10;
qgN = 10000;

a = 0.3;

%pomieszczenia
b=2;
c=4;
d=7;
Vw = b*c*d;
e=2;
f=5;
g=3;
Vp = e*f*g;

%powietrze
cp=1000; %J/(kg*K)
rop=1.2; %kg/m^3

%parametry statyczne i dynamiczne
Cvw = cp*rop*Vw;
Cvp = cp*rop*Vp;

kcw = qgN/((TwewN-TzewN)+a*(TwewN-TpN));
kcwp = a*kcw;
kcp = (a*qgN*(TwewN-TpN))/((TpN-TzewN)*((TwewN-TzewN)+a*(TwewN-TpN)));

%Czesc II
dTzew = 1;
dqg = 0.1*qgN;


X=[qgN qgN 0.6*qgN];
Y=[TzewN TzewN+dTzew TzewN+dTzew];
figure();


for i=1:length(X)

qg0 = X(i);
Tzew0 = Y(i);
%qg0=qgN;
%Tzew0=TzewN;

Tp0 = ((kcp*Tzew0)*(kcw+kcwp)+kcwp*(qg0+kcw*Tzew0))/(kcwp*kcw+kcp*kcw+kcp*kcwp);
Twew0 = (qg0+kcw*Tzew0+kcwp*Tp0)/(kcw+kcwp);


%Czesc III

czas_symulacji = 10000;
t0 = 1000;



M=[Cvw*Cvp Cvw*kcwp+Cvw*kcp+Cvp*kcw+Cvp*kcwp kcw*kcwp+kcw*kcp+kcwp*kcp];
M1=[Cvw kcw+kcwp];
M2=[Cvp kcwp+kcp];
L11=M2;
L12=[kcw*Cvp kcp*kcwp+kcw*kcwp+kcw*kcp];
L21=kcwp;
L22=[kcp*Cvw kcwp*kcw+kcw*kcp+kcwp*kcp];



sim("sim10.slx");

subplot(2,1,1);
hold on
plot(tout, Twew);
title("Twew(s) schemat oparty na transmitancjach");
xlabel("czas symulacji [t]")
ylabel("Temperatura [C]")
legend('qg0 = qgN, Tzew0 = TzewN', 'qg0 = qgN, Tzew0 = TzewN+zmianaTzew', 'qg0 = qgN*procentZmianyQg , Tzew0 = TzewN+zmianaTzew' )

% subplot(2,1,2);
% hold on
% plot(tout, Tp);
% title("Transmitancja Tp(s)");
% xlabel("czas symulacji [t]")
% ylabel("Tp")
% legend('qg0 = qgN, Tzew0 = TzewN', 'qg0 = qgN, Tzew0 = TzewN+zmianaTzew', 'qg0 = qgN*procentZmianyQg , Tzew0 = TzewN+zmianaTzew' )

end

subplot(2, 1, 2)
procent_zmiany_qg = 0.8;
zmianaTzew = [-10, -5, 0, 5, 10];
k=length(zmianaTzew);
grid on;
hold on;
for i=1:length(X)
 
%     Tzew0=TzewN+zmianaTzew(i);
%     qg0 = qgN;
    qg0 = X(i);
    Tzew0 = Y(i);
    Tp0 = ((kcp*Tzew0)*(kcw+kcwp)+kcwp*(qg0+kcw*Tzew0))/(kcwp*kcw+kcp*kcw+kcp*kcwp);
    Twew0 = (qg0+kcw*Tzew0+kcwp*Tp0)/(kcw+kcwp);
    dTzew=1;
    dqg=0.1*qgN;
    [t] = sim('lab4_simulink');
    plot(t, Twew, 'DisplayName', 'zmTzew=');
end
plot(t,Twew);
title("Twew(t) schemat bloki całkujące");
xlabel("Czas [s]");
ylabel("Temperatura [C]");
legend('qg0 = qgN, Tzew0 = TzewN', 'qg0 = qgN, Tzew0 = TzewN+zmianaTzew', 'qg0 = qgN*procentZmianyQg , Tzew0 = TzewN+zmianaTzew' )
