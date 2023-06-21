clear
close all

%Symulacje
czas_systemu=10000;%czas symulacji
t0=1000;%moment wystapieniaskoku
%metoda ze styczną

%Tp
%-------------------------------------------
T_0_tp=100;
T_1_tp=1030;
T_sp=T_1_tp-T_0_tp;
deltaTpx=3;
deltaTpu=1000;
ksTp=deltaTpx/deltaTpu;
%Transmitancja
L12=[ksTp];
M2=[T_sp,1];
L13=[1];
M3=[49, 14, 1, 0];
L14=[1];
M4=[49, 14, 1];
Gm = tf([L12], [M2])
G1 = tf([L13], [M3]);
G2 = tf([L14], [M4]);
[t]=sim('PUSlabnowe');
figure(1)
subplot(3,1,1)
hold on
grid on
plot(t,y);
hold on
grid on
plot(t,e1);
hold on
grid on
plot(t, sp);
title('Wykres PV - Process Variable i e - model obiektu (Tuner), SP');
xlabel("t [s]");
ylabel("T [°]");
legend("PV", "E", "SP");
subplot(3,1,2)
hold on
grid on
plot(t,y3);
hold on
grid on
plot(t,e3);
hold on
grid on
plot(t, sp3);
title('Wykres PV - Process Variable i e - model obiektu (układ niestabilny), SP');
xlabel("t [s]");
ylabel("T [°]");
legend("PV", "E", "SP");
subplot(3,1,3)
hold on
grid on
plot(t,y4);
hold on
grid on
plot(t,e4);
hold on
grid on
plot(t, sp4);
title('Wykres PV - Process Variable i e - model obiektu (układ stabilny), SP');
xlabel("t [s]");
ylabel("T [°]");
legend("PV", "E", "SP");
figure(2)
subplot(3,1,1)
hold on
grid on
plot(t,y1);
hold on
grid on
plot(t,e);
hold on
grid on
plot(t, sp1);
title('Wykres PV - Process Variable i e - obiekt astatyczny (Tuner), SP');
xlabel("t [s]");
ylabel("T [°]");
legend("PV", "E", "SP");
subplot(3,1,2)
hold on
grid on
plot(t,y5);
hold on
grid on
plot(t,e5);
hold on
grid on
plot(t, sp5);
title('Wykres PV - Process Variable i e - obiekt astatyczny (układ niestabilny), SP');
xlabel("t [s]");
ylabel("T [°]");
legend("PV", "E", "SP");
subplot(3,1,3)
hold on
grid on
plot(t,y6);
hold on
grid on
plot(t,e6);
hold on
grid on
plot(t, sp6);
title('Wykres PV - Process Variable i e - obiekt astatyczny (układ stabilny), SP');
xlabel("t [s]");
ylabel("T [°]");
legend("PV", "E", "SP");
figure(3)
subplot(3,1,1)
hold on
grid on
plot(t,y2);
hold on
grid on
plot(t,e2);
hold on
grid on
plot(t, sp2);
title('Wykres PV - Process Variable i e - obiekt statyczny (Tuner), SP');
xlabel("t [s]");
ylabel("T [°]");
legend("PV", "E", "SP");
subplot(3,1,2)
hold on
grid on
plot(t,y7);
hold on
grid on
plot(t,e7);
hold on
grid on
plot(t, sp7);
title('Wykres PV - Process Variable i e - obiekt statyczny (układ stabilny), SP');
xlabel("t [s]");
ylabel("T [°]");
legend("PV", "E", "SP");
subplot(3,1,3)
hold on
grid on
plot(t,y8);
hold on
grid on
plot(t,e8);
hold on
grid on
plot(t, sp8);
title('Wykres PV - Process Variable i e - obiekt statyczny (układ stabilny), SP');
xlabel("t [s]");
ylabel("T [°]");
legend("PV", "E", "SP");

figure(4)
subplot(3,1,1)
hold on
grid on
nyquist(Gm);
subplot(3,1,2)
hold on
grid on
nyquist(G1);
subplot(3,1,3)
hold on
grid on
nyquist(G2);