#¬ариант 7
# y' + 4*x^3 * y = 4*y^2*e^(4*x)*(1-x^3), y(1) = 1
clear all

f = @(x, y) (-4*x^3*y + 4*y^2*e^(4*x)*(1-x^3));
dfx = @(x, y) (-12*y*x^2 + 16*y^2*e^(4*x)*(1 - x^3 - 3/4*x^2));
dfy = @(x, y) (-4*x^3 + 8*y*e^(4*x)*(1-x^3));

dx = 0.1;
x = [0 : dx : 10];
y1(2) = 1;
y2(2) = 1;
y3(2) = 1;
y4(2) = 1;
y4(2) = y4(1) + f(x(1), y4(1)) * dx;
y5(2) = 1;

for i = 1 : 1 : (length(x) - 1)
  y1(i + 1) = y1(i) + f(x(i), y1(i)) * dx; # €вный метод Ёйлера 1 пор€дка
  y2(i + 1) = y2(i) + f(x(i + 1), y2(i) + f(x(i), y2(i)) * dx) * dx; # не€вный метод Ёйлера 1 пор€дка
  y3(i + 1) = y3(i) + dx / 2 * (f(x(i), y3(i)) + f(x(i + 1), y3(i) + f(x(i), y3(i)) * dx)); # метод трапеций (’ойна)
  if (i != (length(x) - 1))
    y4(i + 2) = y4(i) + 2 * f(x(i + 1), y4(i + 1)) * dx; # уточнЄнный метод Ёйлера
  endif
  y5(i + 1) = y5(i) + dx * (f(x(i), y5(i)) + dx / 2 .* (dfx(x(i), y5(i)) + dfy(x(i), y5(i)) * f(x(i), y5(i)))); # исправленный метод Ёйлера
endfor


# среднее абсолютное отклонение
mean(abs(y1 - y2))
mean(abs(y1 - y3))
mean(abs(y1 - y4))
mean(abs(y1 - y5))
mean(abs(y2 - y3))
mean(abs(y2 - y4))
mean(abs(y2 - y5))
mean(abs(y3 - y4))
mean(abs(y3 - y5))
mean(abs(y4 - y5))