#Вариант 7
# y' + 4*x^3 * y = 4*y^2*e^(4*x)*(1-x^3), y(1) = 1
clear all
f = @(x, y) (-4*x^3*y + 4*y^2*e^(4*x)*(1-x^3));

a = 0.5;
dx = 0.1;
x = [0 : dx : 0.6];
y(1) = 1;

for i = 1 : 1 : (length(x) - 1)
  y(i + 1) = y(i) + dx * ((1 - a) * f(x(i), y(i)) + a * f(x(i) + dx / (2 * a), y(i) + dx / (2 * a) * f(x(i), y(i))));
endfor
y

