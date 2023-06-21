s = tf('s');
czas_symulacji=150;

T=9; %najwieksza cyfra numeru indeksu
k=7;  %ostatnia cyfra numeru indeksu
T0=8; %kolejna cyfra od konca
t0=100;

G1=(k/(T*s+1));
G2=(k/(T*s+1))*exp(-T0*s);

[t] = sim("Lab14_simulink");

figure(1)
plot(t, G1);
hold on;
plot(t, G)
title('G1')
grid on;

figure(2)
plot(t, G2);
hold on;
plot(t, G3);
plot(t, G10);
title('G2-z opóźnieniem')
grid on;

figure(3)
subplot(3,1,1)
plot(t, G4);
hold on;
plot(t, G6);
plot(t, G9);
legend("switch on point 0.3", "switch on point 0.5", "switch on point 0.7")
title("Histereza 3 różne wartosci dla PV");
grid on;
xlabel("t[s]")
ylabel("temperatura [*C]")

subplot(3,1,2)
plot(t, G5);
hold on;
plot(t, G7);
plot(t, G8);
legend("switch on point 0.3", "switch on point 0.5", "switch on point 0.7")
title("Histereza 3 różne wartosci dla CV");
grid on;
xlabel("t[s]")
ylabel("Moc [W]")

subplot(3,1,3)
plot(t, G11);
hold on;
plot(t, G12);
plot(t, G13);
legend("switch on point 0.3", "switch on point 0.5", "switch on point 0.7")
title("Histereza 3 różne wartosci dla SP");
grid on;
xlabel("t[s]")
ylabel("Moc [W]")

figure(4)
grid on;
hold on;
plot(t, G1);
plot(t, G2);
legend("PV - bez opoznien", "PV - z opoznieniem")
xlabel("t[s]")
ylabel("temperatura [*C]")
