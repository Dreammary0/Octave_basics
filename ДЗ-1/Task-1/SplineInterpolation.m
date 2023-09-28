#Б9119-09.03.04прогин Сазонтова Мария
#Построить интерполяционные сплайны второй степени
#7. y(x) = sqrt(x)

clear all;
format long;
output_precision(15);

n = 5;#колво парабол
x = [0 6 9 12 15 18]';
y = [1 1 1 1 1 1]';
X(1:1:2*n) = 0;
B(1:1:2*n) = 0;
A(1:1:2*n, 1:1:2*n) = 0;

for i = 1:1:n+1
  y(i) = sqrt(x(i));
endfor

for i = 1:1:n
  B(i) = y(i+1) - y(i);
endfor

for i = 1:1:n
  A(i, 2*i-1) = x(i+1) - x(i);
  A(i, 2*i) = (x(i+1) - x(i))^2;
endfor

for i = 1:1:(n-1)
  A(i+n, 2*i-1) = 1;
  A(i+n, 2*i) = 2*(x(i+1) - x(i));
  A(i+n, 2*i+1) = -1;
endfor

A(2*n, 2*n-1) = 1;
A(2*n, 2*n) = 2*(x(n+1) - x(n));

X = A^(-1)*B';

for i = 1:1:n
  a(i) = y(i);
  b(i) = X(2*i-1);
  c(i) = X(2*i);
endfor

k = 0;
for i = 1:1:n
  for x0 = x(i):0.1:x(i+1)
    k = k+1;
    x2(k) = x0;
    y2(k) = a(i) + b(i)*(x0 - x(i)) + c(i)*(x0 - x(i))^2;
  endfor
endfor
plot(x, y,'s','MarkerEdgeColor','k','MarkerSize',20, x2,y2,'-','LineWidth',2)
