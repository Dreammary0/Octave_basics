# y' + 4*x^3 * y = 4*y^2*e^(4*x)*(1-x^3), y(1) = 1
clear all

f = @(x, y) (-4*x^3*y + 4*y^2*e^(4*x)*(1-x^3));

dx = 0.01;
x = [0 : dx : 1];
y1(1) = 1;
y2(1) = 1;
y3(1) = 1;

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
y1
y2
y3
mean(abs(y1 - y2))
mean(abs(y1 - y3))
mean(abs(y2 - y3))
