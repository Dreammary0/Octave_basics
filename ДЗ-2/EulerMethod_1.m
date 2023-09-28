# ¬ариант 7
# y' = 4 - x^2 + 2*y, y(0) = 1 
clear all
format long

f = @(x, y) (4 - x^2 + 2*y);
dfx = @(x, y) (- 2 * x);
dfy = @(x, y) (2);

dx = 0.1;
x = [0 : dx : 9];
y1(1) = 1;
y2(1) = 1;
y3(1) = 1;
y4(1) = 1;
y4(2) = y4(1) + f(x(1), y4(1)) * dx;
y5(1) = 1;

yr = 11/4*exp(x.^2) + x.*x / 2 + x/2 - 7/4 # точное значение

for i = 1 : 1 : (length(x) - 1)
  y1(i + 1) = y1(i) + f(x(i), y1(i)) * dx; # €вный метод Ёйлера 1 пор€дка
  y2(i + 1) = y2(i) + f(x(i + 1), y2(i) + f(x(i), y2(i)) * dx) * dx; # не€вный метод Ёйлера 1 пор€дка
  y3(i + 1) = y3(i) + dx / 2 * (f(x(i), y3(i)) + f(x(i + 1), y3(i) + f(x(i), y3(i)) * dx)); # метод трапеций (’ойна)
  if (i != (length(x) - 1))
    y4(i + 2) = y4(i) + 2 .* dx * f(x(i + 1), y4(i + 1)); # уточнЄнный метод Ёйлера
  endif
  y5(i + 1) = y5(i) + dx * (f(x(i), y5(i)) + dx / 2 .* (dfx(x(i), y5(i)) + dfy(x(i), y5(i)) * f(x(i), y5(i)))); # исправленный метод Ёйлера
endfor

# среднее абсолютное отклонение
err1 = mean(abs(y1 - yr));
err2 = mean(abs(y2 - yr));
err3 = mean(abs(y3 - yr));
err4 = mean(abs(y4 - yr));
err5 = mean(abs(y5 - yr));

a = 15;
y6(1) = 1;

for i = 1 : 1 : (length(x) - 1)
  y6(i + 1) = y6(i) + dx * ((1 - a) * f(x(i), y6(i)) + a * f(x(i) + dx / (2 * a), y6(i) + dx / (2 * a) * f(x(i), y6(i))));
endfor

err6 = mean(abs(y6 - yr));

y7(1) = 1;
y8(1) = 1;
y9(1) = 1;

yr = 11/4*exp(x.^2) + x.*x / 2 + x/2 - 7/4 # точное значение

for i = 1 : 1 : (length(x) - 1)
y7(i + 1) = y7(i) + dx * f(x(i), y7(i));
y8(i + 1) = y8(i) + dx * f(x(i), y8(i));
y9(i + 1) = y9(i) + dx * f(x(i), y9(i));
endfor

for i = 2 : 1 : (length(x) - 1)
y7(i + 1) = y7(i) + dx * (3 ./ 2 .* f(x(i), y7(i)) - 1 ./ 2 .* f(x(i-1), y7(i-1)));
y8(i + 1) = y8(i) + dx * (3 ./ 2 .* f(x(i), y8(i)) - 1 ./ 2 .* f(x(i-1), y8(i-1)));
y9(i + 1) = y9(i) + dx * (3 ./ 2 .* f(x(i), y9(i)) - 1 ./ 2 .* f(x(i-1), y9(i-1)));
endfor

for i = 3 : 1 : (length(x) - 1)
y8(i + 1) = y8(i) + dx * (23 ./ 12 .* f(x(i), y8(i)) - 16 ./ 12 .* f(x(i - 1), y8(i - 1)) + 5 ./ 12 .* f(x(i - 2), y8(i - 2)));
y9(i + 1) = y9(i) + dx * (23 ./ 12 .* f(x(i), y9(i)) - 16 ./ 12 .* f(x(i - 1), y9(i - 1)) + 5 ./ 12 .* f(x(i - 2), y9(i - 2)));
endfor

for i = 4 : 1 : (length(x) - 1)
  y9(i + 1) = y9(i) + dx * (55 ./ 24 .* f(x(i), y9(i)) - 59 ./ 24 .* f(x(i - 1), y9(i - 1)) + 37 ./ 24 .* f(x(i - 2), y9(i - 2)) - 9 ./ 24 .* f(x(i - 3), y9(i - 3)));
endfor

err7 = mean(abs(y7 - yr));
err8 = mean(abs(y8 - yr));
err9 = mean(abs(y9 - yr));

[err1 err2 err3 err4 err5 err6 err7 err8 err9]'
#figure(1)
#plot(x, yr, x, y1, x, y2, x, y3, x, y4, x, y5, x, y6, x, y7, x, y8, x, y9)
