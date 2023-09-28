#Б9119-09.03.04прогин Сазонтова Мария
#Построить интерполяционный полином(Лагранж)
#7. y(x) = sqrt(x)

clear all;
format long;
output_precision(15);

n = 6;
x = [0 6 9 12 15 18]';
y = [1 1 1 1 1 1]';
x0 = 21;
sum = 0;

for i = 1:1:n
  y(i) = sqrt(x(i));
  y(i);
endfor

  x2=(0:0.01:18);
  for k=1:1:length(x2)
  x0=x2(k);
  sum=0;
  for i = 1:1:n
  pr = 1;
  for j=[1:1:(i-1) (i+1):1:n]
    pr = pr*(x0-x(j))/(x(i)-x(j));
  endfor
  sum = sum + pr*y(i);
endfor
y2(k)=sum;
  end

plot(x, y, 's', 'MarkerEdgeColor', 'k', 'MarkerSize', 10, x2, y2, '-', 'LineWidth', 2)