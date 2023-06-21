clear
close all
s=tf('s');

%Symulacje
czas_systemu=1000;%czas symulacji
t0=200;%moment wystapieniaskoku
k_s=7;
T_sp=9;
%Transmitancja
To=[20,40,80,160];
k=length(To);
G=k_s/((T_sp*s+1)*((T_sp+10)*s+1));
L11=[7];
M11=[171,28,1];

Kp=0.119332720508127;
Ki=0.003575895093232054;

R=Kp+Ki/s;
figure(1)
for z=1:k
hold on 
grid on
To_1=To(z);
G=(k_s/((T_sp*s+1)*((T_sp+10)*s+1)))*exp(-To_1*s);
[t]=sim('lab12');
plot(t,PV);
xlabel("t[s]");
ylabel("PV");
title("Wpływ opóźnienia transportowego dla PV");
legend("To=20","To=40","To=80","To=160");
end
figure(2)
for z=1:k
subplot(2,2,z)
hold on 
grid on
To_1=To(z);
G=(k_s/((T_sp*s+1)*((T_sp+10)*s+1)))*exp(-To_1*s);
Z=G*R;
[t]=sim('lab12');
bode(Z);
end
figure(3)
for z=1:k
subplot(2,2,z)
hold on 
grid on
To_1=To(z);
G=(k_s/((T_sp*s+1)*((T_sp+10)*s+1)))*exp(-To_1*s);
Z=G*R;
[t]=sim('lab12');
nyquist(Z);
end
figure(4)
for z=1:k
hold on 
grid on
To_1=To(z);
G=(k_s/((T_sp*s+1)*((T_sp+10)*s+1)))*exp(-To_1*s);
[t]=sim('lab12');
plot(t,CV);
xlabel("t[s]");
ylabel("CV");
title("Wpływ opóźnienia transportowego dla CV");
legend("To=20","To=40","To=80","To=160");
end
figure(5)
for z=1:k
hold on 
grid on
To_1=To(z);
G=(k_s/((T_sp*s+1)*((T_sp+10)*s+1)))*exp(-To_1*s);
[t]=sim('lab12');
plot(t,PV);
xlabel("t[s]");
ylabel("E");
title("Wpływ opóźnienia transportowego dla E");
legend("To=20","To=40","To=80","To=160");
end