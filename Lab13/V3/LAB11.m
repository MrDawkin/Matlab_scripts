clear;
close all;

a = 0.3; %współczynnik a
TzewN = -20;
TwewN = 20;
TpN = 10;
QgN = 10000;

%Twew0 = TwewN;
Tzew0 = TzewN+7;  %INNY PUNKT PRACY TZEW0 = -13 STOPNI
Tp0 = TpN; 
%wewnątrz
aw = 2;
bw = 5;
cw = 6;

%poddasze
ap = 6;
bp = 5;
cp = 1;

%************************************%
Vw = aw * bw * cw;  %objetosci pomieszczen
Vp = ap * bp * cp;

%Ciepło właściwe i gęstość
cp=1000;    %kJ/(kg*K) 
rop=1.2;    %kg/m3

%Parametry statyczne
Kcw = (QgN)/(TwewN-TzewN+a*TwewN-a*TpN);
Kcwp = (a*QgN)/(TwewN-TzewN+a*TwewN-a*TpN);
Kcp = (a*QgN)*(TwewN-TpN)/((TpN-TzewN)*(TwewN-TzewN+a*(TwewN-TpN)));

%Parametry dynamiczne
Cvw = cp*rop*Vw;
Cvp = cp*rop*Vp;

Qg0=QgN;
Tp0=(Kcp*Tzew0*(Kcw+Kcwp)+Kcwp*(Qg0+Kcw*Tzew0))/(Kcw*Kcwp+Kcw*Kcp+Kcwp*Kcp);
Twew0=(Qg0+Kcw*Tzew0+a*Kcw*Tp0)/(Kcw+Kcwp);

%Twew0= (Kcwp*Tp0+Kcp*Tp0-Kcp*Tzew0)/Kcwp;         %nowe równanie stanu
%Qg0 = Kcw*Twew0-Kcw*Tzew0+Kcwp*Twew0-Kcwp*Tp0; %nowe równanie stanu

czas_symulacji = 10000;
t0 = 1000;    %moment wystapieniaskoku

drugi_step_time = 3000;
spadekTp = -10;

TiInd = 0.080;
KpInd = 5800;
KdInd = 0;

dTzew = 0;
dTp = 2;
dTp2 = 10;

%saturacja
upper_limit = 12500;
lower_limit = 0;
Kb = 5; %windup
[t]=sim('LAB13_sim');

%Ki z simulinka 38.2166019284268
%Kp z simulinka 2386.66771221404

% figure(1);
% subplot(1,2,1);
% xlim([0 5000]);
% title("Zmienna kontrolna - scenariusz 1");
% grid on;
% hold on;
% plot(t,CV_URO,"-");
% plot(t,CV_saturation,"--");
% plot(t,CV_saturation_windup,"-.");
% legend("CV - nic", "CV - saturation", "CV - saturation + windup");
% xlabel("Czas symulacji [s]");
% ylabel("Moc [W]");
% 
% subplot(1,2,2);
% xlim([0 5000]);
% title("Zmienna procesowa - scenariusz 1");
% grid on;
% hold on;
% plot(t,Tp_simulink,"-");
% plot(t,Tp_saturation,"--");
% plot(t,Tp_saturation_windup,"-.");
% plot(t,URO_wartosc_zadana,"c");
% legend("PV - nic", "PV - saturation", "PV - saturation + windup", "Set Point");
% xlabel("Czas symulacji [s]");
% ylabel("Temperatura [C°]");
% 
% figure(2);
% subplot(1,2,1);
% title("Zmienna kontrolna - scenariusz 2");
% grid on;
% hold on;
% plot(t,CV_URO_scenariusz2,"-");
% plot(t,CV_saturation_scenariusz2,"--");
% plot(t,CV_saturation_windup_scenariusz2,"-.");
% legend("CV - nic", "CV - saturation", "CV - saturation + windup");
% xlabel("Czas symulacji [s]");
% ylabel("Moc [W]");
% 
% subplot(1,2,2);
% title("Zmienna procesowa - scenariusz 2");
% grid on;
% hold on;
% plot(t,Tp_simulink_scenariusz2,"-");
% plot(t,Tp_saturation_scenariusz2,"--");
% plot(t,Tp_saturation_windup_scenariusz2,"-.");
% plot(t,URO_wartosc_zadana_scenariusz2,"c");
% legend("PV - nic", "PV - saturation", "PV - saturation + windup", "Set Point");
% xlabel("Czas symulacji [s]");
% ylabel("Temperatura [C°]");
% hold off;

figure(3);
title("Porównanie różnych współczynników anty-windUpów - PV");
hold on;
grid on;
xlabel("Czas symulacji [s]");
ylabel("Temperatura [C°]");
Kb = 20; %windup
plot(t,Tp_saturation_windup);
% [t]=sim('LAB11_sim');
% Kb = -1; %windup
% plot(t,Tp_saturation_windup);
% Kb = 10; %windup
% [t]=sim('LAB11_sim');
% plot(t,Tp_saturation_windup);
% Kb = 500; %windup
% [t]=sim('LAB11_sim');
% plot(t,Tp_saturation_windup);
% legend("Kb = 6","Kb = 1","Kb = 10","Kb = 50");

% figure(4);
% title("Porównanie różnych współczynników anty-windUpów - CV");
% hold on;
% grid on;
% xlabel("Czas symulacji [s]");
% ylabel("Moc [W]");
% Kb = 20; %windup
% plot(t,CV_saturation_windup);
% %[t]=sim('LAB11_sim');
% % Kb = -1; %windup
% % plot(t,CV_saturation_windup);
% % Kb = 5; %windup
% %[t]=sim('LAB11_sim');
% %plot(t,CV_saturation_windup);
% %Kb = 500; %windup
% %[t]=sim('LAB11_sim');
% %plot(t,CV_saturation_windup);
% %legend("Kb = 6","Kb = 1","Kb = 10","Kb = 50");
% hold off;
