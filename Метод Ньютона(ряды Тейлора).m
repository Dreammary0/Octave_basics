##Ряд тейлора
##Метод Ньютона
clear all
f=@(x) log(x*x+1)*cos(x);
x=[-10;2;10];
df=@(x) 2*x/(x*x+1)*cos(x)-log(x*x+1)*sin(x);

x0=-5;
x2=x0;
e=0.000001;
k=0;

while (abs(f(x2))>e)
k++;
x2=x0-f(x0)/df(x0);

[k x2 f(x2)]
x0=x2;
endwhile
