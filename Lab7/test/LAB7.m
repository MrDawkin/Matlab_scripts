clear
close all

%Zmienne nominalne
a1=0.3;%współczynnik
T_zew_N=-20;
T_wew_N=20;
Tp_N=10;
q_g_N=10*10^3;
%Objętości
aw = 2;
bw = 4;
cw = 7;

%poddasze
ap = 7;
bp = 4;
cp = 1;

%************************************%
Vw = aw * bw * cw;  %objetosci pomieszczen
Vp = 40;
%Ciepło właściwe i gęstość
cp=1000;%kJ/(kg*K) 
rop=1.2;%kg/m3
%Wzory na parametry statyczne
K_cw=(q_g_N)/(T_wew_N-T_zew_N+a1*(T_wew_N-Tp_N));
K_cwp=(a1*(q_g_N))/(T_wew_N-T_zew_N+a1*(T_wew_N-Tp_N));
K_cp=((a1*q_g_N)*(T_wew_N-Tp_N))/((Tp_N-T_zew_N)*(T_wew_N-T_zew_N+a1*(T_wew_N-Tp_N)));
%Parametry dynamiczne
Cvw=cp*rop*Vw;
Cvp=cp*rop*Vp;
%Punkt pracy
T_zew_0=T_zew_N;
% q_g_0=q_g_N;
% Tp_0=(K_cp*T_zew_0*(K_cw+K_cwp)+K_cwp*(q_g_0+K_cw*T_zew_0))/(K_cw*K_cwp+K_cw*K_cp+K_cwp*K_cp);
% T_wew_0=(q_g_0+K_cw*T_zew_0+a1*K_cw*Tp_0)/(K_cw+K_cwp);
Tp_0=12;
T_wew_0=(K_cwp*Tp_0+K_cp*(Tp_0-T_zew_0))/K_cwp;
q_g_0=K_cw*(T_wew_0-T_zew_0)-K_cwp*(T_wew_0-Tp_0);
%Symulacje
czas_systemu=5000;%czas symulacji
t0=0;%moment wystapienia skoku
dTzew=1;%zakłócenia
dqg=0.1*q_g_N;
%metoda ze styczną
%Twew
%-------------------------------------------
T_0_wew=0;
T_1_wew=350;
T=T_1_wew-T_0_wew;
deltaTwewx=4;
deltaTwewu=dqg;
ksTwew=deltaTwewx/deltaTwewu;
%Transmitancja
L11=[ksTwew];
M1=[T,1];
%Tp
%-------------------------------------------
T_0_tp=100;
T_1_tp=1050;
T_sp=T_1_tp-T_0_tp;
deltaTpx=2.85;
deltaTpu=dqg;
ksTp=deltaTpx/deltaTpu;
%Transmitancja
L12=[ksTp];
M2=[T_sp,1];
%metoda dwupunktowa
%Twew
%----------------------------------------------
deltaTwewmdx=4;
deltaTwewmdu=dqg;
kmdTwew=deltaTwewmdx/deltaTwewmdu;
x_1w=(28.3*deltaTwewmdx)/100;
x_2w=(63.2*deltaTwewmdx)/100;
t_1w=100;
t_2w=300;
T2=1.5*(t_2w-t_1w);
To=t_2w-T2;
%Transmitancja
L21=[kmdTwew];
M3=[T2,1];
%Tp
%----------------------------------------------
deltaTpmdx=2.85;
deltaTpmdu=dqg;
kmdTp=deltaTpmdx/deltaTpmdu;
x_1p=(28.3*deltaTpmdx)/100;
x_2p=(63.2*deltaTpmdx)/100;
t_1p=350;
t_2p=700;
T3=1.5*(t_2p-t_1p);
To1=t_2p-T3;
%Transmitancja
L22=[kmdTp];
M4=[T3,1];


%Kp = 931.03;
Kp =2948;
%Ki = 1/0.626;
Ki =1/0.1129;
Kd = 0;

[t]=sim('LAB7_PI');
subplot(2,2,1);
plot(t,Tp_simulink);
title("Tp na obiekcie");
subplot(2,2,2)
plot(t, e_simulink);
title("e uchyb obiekt");
subplot(2, 2, 3)
plot(t,Tp_model);
title("Tp na modelu");
subplot(2,2,4)
plot(t,e_model);
title("e uchyb model");