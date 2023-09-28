#Б9119-09.03.04прогин Сазонтова Мария
#16. y(x) = sqrt(x)
#Найти значение с помощью интерполяционного полинома Ньютона

clear all
format long;
output_precision(15);

x = [6 9 12 15]'; #center 12 
y = sqrt(x);
n = 4;
dy(1:1:n, 1:1:n) = 0;
dy(:,1) = y;

for j=2:1:n
for i=1:1:(n-j+1)
dy(i,j) = dy(i+1,j-1) - dy(i,j-1);
endfor
endfor
dy;
y= dy(1,2)/3 + dy(1,3)/2 + dy(1,4)/9  
