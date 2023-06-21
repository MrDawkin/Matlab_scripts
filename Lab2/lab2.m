%Dane
TzewN=-20;
TwewN=20;
TpN=10;
qgN=10000;
a=0.3;
%tymczasowe

qg0=0:0.1*qgN:qgN;
Tzew0=[-20; -5; 5; 20];
l=length(Tzew0);

%wzory
kcw=qgN/(TwewN-TzewN+a*(TwewN-TpN));
kcwp=a*qgN/(TwewN-TzewN+a*(TwewN-TpN));
kcp=(a*qgN/(TwewN-TzewN+a*(TwewN-TpN))*(TwewN-TpN))/(TpN-TzewN);

Twew=((qg0-kcw*Tzew0)/kcwp)+(kcp*Tzew0)/(kcwp+kcp)/((kcw-kcwp)/(kcwp))-(kcwp/(kcwp+kcp));
Tp=(kcwp*Twew+kcp*Tzew0)/(kcwp+kcp);

%generacja wykresów

figure(1);
hold on;
grid on;

for i=1:l
    plot(qg0,Twew)
end

xlabel('qg0');
ylabel('Twew');
title('Twew(qg0)');
legend('Tzew=-20','Tzew=-5','Tzew=5','Tzew=20');
