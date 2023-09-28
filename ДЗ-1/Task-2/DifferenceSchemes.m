#Б9119-09.03.04прогин Сазонтова Мария
#16. y(x) = sqrt(x)
#Найти значение первой и второй производной в центре интервала 
#при помощи разностных схем различного порядка

clear all
format long;
output_precision(15);

x = [6 9 12 15 18]'; #center 12 
y = sqrt(x)
for i=6:3:18
pr=1/(2*sqrt(i));
endfor

y = (sqrt(15)-sqrt(12))/3 #f'(x) = (f(x+dx) - f(x))/dx + O(dx) || f(x+dx)
y = (sqrt(12)-sqrt(9))/3 #f'(x) = (f(x) - f(x-dx))/dx +O(dx) || f(x-dx) // Схема центральной разности
y = (sqrt(15)-sqrt(9))/(2*3) #f'(x) = (f(x+dx) - f(x-dx))/2dx + O(dx^2) || f(x+dx) - f(x-dx) //
y = (sqrt(15) - 2*sqrt(12) + sqrt(9))/(3*3) # f''(x) = (f(x+dx) - 2f(x) + f(x-dx))/(dx)^2  || f(x+dx) + f(x-dx)
