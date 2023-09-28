clear all;

##аппроксимируем прямую y=kx+b
x=(1:1:14)';
y=[2 3 2 2 4 3 4 3 4 6 4 4 6 6]';
n=14;

A=[sum(x.*x) sum(x); sum(x) n]';
B=[sum(y.*x) sum(y)]';

X=A^(-1)*B
A
B

##тип проверка, что все найдено верно
if (AX=B) 
   c="все верно";
 else 
   c="где то ошибка";
endif
c

##вывод графика
k=X(1);
b=X(2);
x2=(1:0.01:14);
y2=k*x2+b;
plot(x, y,'s','MarkerEdgeColor','k','MarkerSize',20, x2,y2,'-','LineWidth',2)


