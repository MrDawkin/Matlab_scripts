figure;
hold on;
grid on;
xlabel('Os X');
ylabel('Os Y');
title('Przykladowy skrypt');
text(4,10,'\leftarrow punkt');

x=-10:1:10;
a=-2:.5:2;
l=length(a);
kolor='rgbc';

for i=1:l
    plot(x, a(i)*x.*x, kolor(i));
end
