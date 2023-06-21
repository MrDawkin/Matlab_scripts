clear all
clc

q_g_N=10*10^3;
t0=1000;%moment wystapienia skoku
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
s = tf('s');
Gm = (ksTp/(T_sp*s+1))*exp(-t0*s); %model naszego obiektu
G1 = 1/(s*(7*s+1)*(7*s+1)); %obiekt astatyczny
G2 = 1/((7*s+1)*(7*s+1));  %obiekt statyczny

G11=[49, 14, 1, 0];
G22=[49, 14, 1];
[t]=sim('lab11_simulink');

figure(1)
subplot(2,2,1);
plot(t, y);
title("srednie");
subplot(2,2,2);
plot(t, y3);
title("min");
subplot(2,2,3);
plot(t, y6);
title("max");

figure(2)
subplot(2,2,1);
plot(t, y1);
title("srednie");
subplot(2,2,2);
plot(t, y4);
title("min");
subplot(2,2,3);
plot(t, y7);
title("max");

figure(3);
subplot(2,2,1);
plot(t, y2);
title("srednie");
subplot(2,2,2);
plot(t, y5);
title("min");
subplot(2,2,3);
plot(t, y8);
title("max");

figure(4)
subplot(2,2,1);
plot(t, e);
title("srednie");
subplot(2,2,2);
plot(t, e3);
title("min");
subplot(2,2,3);
plot(t, e6);
title("max");

figure(5)
subplot(2,2,1);
plot(t, e1);
title("srednie");
subplot(2,2,2);
plot(t, e4);
title("min");
subplot(2,2,3);
plot(t, e7);
title("max");

figure(6);
subplot(2,2,1);
plot(t, e2);
title("srednie");
subplot(2,2,2);
plot(t, e5);
title("min");
subplot(2,2,3);
plot(t, e8);
title("max");
