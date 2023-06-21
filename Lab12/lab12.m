clear all
clc

q_g_N=10*10^3;
%t0=1000;%moment wystapienia skoku
dqg=0.1*q_g_N;
T_0_tp=100;
T_1_tp=1050;
T_sp=T_1_tp-T_0_tp;
deltaTpx=2.85;
deltaTpu=dqg;
ksTp=deltaTpx/deltaTpu;
%Transmitancja
L12=[ksTp];
M2=[T_sp,1];

t0=20;
k = 7;
T0 = 9;

s = tf('s');
Gm = (ksTp/(T_sp*s+1))*exp(-t0*s); %model naszego obiektu

Gd = 7/(9*s+1)*(9+10)*(s+1)*exp(-t0*s);

G1 = 1/(s*(7*s+1)*(7*s+1)); %obiekt astatyczny
G2 = 1/((7*s+1)*(7*s+1));  %obiekt statyczny

G11=[49, 14, 1, 0];
G22=[49, 14, 1];
GDD=[171, 190, 19];

Kp=0.819289998078674;
Ki=0.0433692037712159;
R = Kp + Ki/s;
T0W=[10, 15, 30, 40];
l=length(T0W);
[t]=sim('lab12_simulink');

% figure(1)
% plot(t, y, 'DisplayName', "T0= "+string(T0));
figure(1)
for i=1:l
    T0=T0W(i);
    [t]=sim('lab12_simulink');
    plot(t, y, 'DisplayName', "T0= "+string(T0));
    hold on;
    grid on;
end


