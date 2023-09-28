#Б9119-09.03.04прогин Сазонтова Мария
#Построить интерполяционный полином(прямой метод)
#7. y(x) = sqrt(x)

clear all;
format long;
output_precision(15);

n = 6;
x = [0 6 9 12 15 18]';
y = [1 1 1 1 1 1]';

for i = 1:1:n
  y(i) = sqrt(x(i));
  y(i)
endfor

for i = 1:1:n
  for j = 1:1:n
    A(i,j) = x(i)^(j-1);
  endfor
endfor

k = A^(-1)*y;
x0 = 21;
sum = 0;
for i = 1:1:n
  sum = sum + k(i)*x0^(i-1);
endfor
sum;
plot(x, y, 's', 'MarkerEdgeColor', 'k', 'MarkerSize', 10, x, y, '-', 'LineWidth', 2)