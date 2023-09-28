# Вариант 7
# y' = 4 - x^2 + 2*y, y(0) = 1 
format long
clear all

f = @(x, y) (4 - x^2 + 2*y);

dx = 0.1;
x = [0 : dx : 10];
y1(1) = 1;
y2(1) = 1;
y3(1) = 1;

yr = 11/4*exp(x.^2) + x.*x / 2 + x/2 - 7/4 # точное значение

for i = 1 : 1 : (length(x) - 1)
y1(i + 1) = y1(i) + dx * f(x(i), y1(i));
y2(i + 1) = y2(i) + dx * f(x(i), y2(i));
y3(i + 1) = y3(i) + dx * f(x(i), y3(i));
endfor

for i = 2 : 1 : (length(x) - 1)
y1(i + 1) = y1(i) + dx * (3 ./ 2 .* f(x(i), y1(i)) - 1 ./ 2 .* f(x(i-1), y1(i-1)));
y2(i + 1) = y2(i) + dx * (3 ./ 2 .* f(x(i), y2(i)) - 1 ./ 2 .* f(x(i-1), y2(i-1)));
y3(i + 1) = y3(i) + dx * (3 ./ 2 .* f(x(i), y3(i)) - 1 ./ 2 .* f(x(i-1), y3(i-1)));
endfor

for i = 3 : 1 : (length(x) - 1)
y2(i + 1) = y2(i) + dx * (23 ./ 12 .* f(x(i), y2(i)) - 16 ./ 12 .* f(x(i - 1), y2(i - 1)) + 5 ./ 12 .* f(x(i - 2), y2(i - 2)));
y3(i + 1) = y3(i) + dx * (23 ./ 12 .* f(x(i), y3(i)) - 16 ./ 12 .* f(x(i - 1), y3(i - 1)) + 5 ./ 12 .* f(x(i - 2), y3(i - 2)));
endfor

for i = 4 : 1 : (length(x) - 1)
  y3(i + 1) = y3(i) + dx * (55 ./ 24 .* f(x(i), y3(i)) - 59 ./ 24 .* f(x(i - 1), y3(i - 1)) + 37 ./ 24 .* f(x(i - 2), y3(i - 2)) - 9 ./ 24 .* f(x(i - 3), y3(i - 3)));
endfor

err1 = mean(abs(y1 - yr))
err2 = mean(abs(y2 - yr))
err3 = mean(abs(y3 - yr))





