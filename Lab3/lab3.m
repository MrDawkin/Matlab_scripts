clear all;
close all;

%parametry równania
a0 = 5;
a1 = 7;
b = 7;

czas_symulacji = 50;

t0=10; %moment wystąpienia skoku
u0=0; %wartosc poczatkowa wymuszenia
du=1; %przyrost wartosci, wartosc koncowa wtedy u0+du(do bloku step)
%du=0;

%warunek poczatkowy - rozpoczynaniesymualcji w pkt. rownowagi
x0=b*u0/a0;
%x0=0.45;
%wywolanie symulacji z poziomu skryptu
[t] = sim('lab3_s');
%wyniki na wykresie
figure();
plot(t, x)
xlabel('t');
ylabel('x')
title('x(t)')