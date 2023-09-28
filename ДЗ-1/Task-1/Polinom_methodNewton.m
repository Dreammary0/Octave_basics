#Б9119-09.03.04прогин Сазонтова Мария
#Построить интерполяционный полином(Ньютон)
#7. y(x) = sqrt(x)

clear all;
format long;
output_precision(15);

n = 6;
dx = 1;
x = [0 6 9 12 15 18]';
y = [1 1 1 1 1 1]';
x0 = 21;

for i = 1:1:n
  y(i) = sqrt(x(i));
  y(i)
endfor

dy(:,1) = y;
for j = 2: 1: n
  for i = 1: 1: (n - j + 1)
    dy(i,j) = (dy(i+1,j-1) - dy(i, j - 1)) / (x(i + j - 1) - x(i));
  endfor
endfor
sum = 0;
for i = 1: 1: n
  pr = 1;
  for j = 1: 1: (i - 1)
    pr = pr* (x0 - x(j));
  endfor
  sum += dy(1,i)*pr;
endfor
sum;

plot(x, y, 's', 'MarkerEdgeColor', 'k', 'MarkerSize', 10, x, y, '-', 'LineWidth', 2)