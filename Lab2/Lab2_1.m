close all;
clear;
clc;

qgN = 10000;
TzewN = -20;
TwewN = 20;
TpN = 10;




a = 0.3;

Kcw = qgN/((TwewN-TzewN)+a*(TwewN-TpN));
Kcwp = a*Kcw;
Kcp = (a*qgN*(TwewN-TpN))/((TpN-TzewN)*((TwewN-TzewN)+a*(TwewN-TpN)));

Tptest = ((Kcp*TzewN)*(Kcw+Kcwp)+Kcwp*(qgN+Kcw*TzewN))/(Kcwp*Kcw+Kcp*Kcw+Kcp*Kcwp);
Twewtest = (qgN+Kcw*TzewN+Kcwp*Tptest)/(Kcw+Kcwp);

qg0 = 0:0.1*qgN:qgN;
Tzew = [-20, -5, 5, 20];

figure()

for i=1:length(Tzew)

Twew0 = (qg0+Kcw*Tzew(i)+Kcwp*TpN)/(Kcw+Kcwp);

subplot(2,2,1);
hold on
grid on;
plot(qg0, Twew0, 'DisplayName', "Tzew0="+num2str(Tzew(i)));

end
legend
plot(qgN, TwewN, 'ro','DisplayName',"Wart Nom");
title("Twew(qg)");
ylabel("Twew");
xlabel("qg");

for i=1:length(Tzew)

Tp0 = ((Kcp*Tzew(i))*(Kcw+Kcwp)+Kcwp*(qg0+Kcw*Tzew(i)))/(Kcwp*Kcw+Kcp*Kcw+Kcp*Kcwp);
subplot(2,2,2);
hold on
grid on;
plot(qg0, Tp0, 'DisplayName', "Tzew0="+num2str(Tzew(i)));
end
legend
plot(qgN, TpN, 'ro','DisplayName',"Wart Nom");
title("Tp(qg)");
ylabel("Tp");
xlabel("qg");


Tzew0 = -20:20;
qg = [0, 0.1*qgN, 0.5*qgN, qgN];

for j=1:length(qg)

Twew0 = (qg(j)+Kcw*Tzew0+Kcwp*TpN)/(Kcw+Kcwp);

subplot(2,2,3);
hold on
grid on;
plot(Tzew0, Twew0, 'DisplayName', "qg="+num2str(qg(j)));

end
legend
plot(TzewN, TwewN, 'ro','DisplayName',"Wart Nom");
title("Twew(Tzew)");
ylabel("Twew");
xlabel("Tzew");


for j=1:length(qg)
Tp0 = ((Kcp*Tzew0)*(Kcw+Kcwp)+Kcwp*(qg(j)+Kcw*Tzew0))/(Kcwp*Kcw+Kcp*Kcw+Kcp*Kcwp);
subplot(2,2,4);
hold on
grid on;
plot(Tzew0, Tp0, 'DisplayName', "qg="+num2str(qg(j)));

end
legend
plot(TzewN, TpN, 'ro','DisplayName',"Wart Nom");
title("Tp(Tzew)");
ylabel("Tp");
xlabel("Tzew");



