# Вариант 7
# y' = 4 - x^2 + 2*y, y(0) = 1 
clear all
format long

f = @(x, y) (4 - x.^2 + 2*y);

a = 0.6;
dx = 0.1;
x = [0 : dx : 10];
y(1) = 1;

yr = 2.75*exp(x.^2) + x.*x / 2 + x/2 - 7/4 # точное значение

for i = 1 : 1 : (length(x) - 1)
y(i+1) = y(i) + dx*((1-a)*f(x(i),y(i)) + a*f(x(i) + (dx/(2*a)),y(i) + (dx*f(x(i),y(i)))/(2*a)));
endfor

# среднее абсолютное отклонение
err6 = mean(abs(y - yr))




