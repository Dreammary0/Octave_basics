##Метод хорд
clear all
f=@(x) log(x*x+1)*cos(x);

x=[-10;2;10];
a=-6;
b=-4;
c=(a+b)/2;
e=0.000001;
k=0;

while (abs(f(c))>e)
  k++;
  c=a-(b-a)*f(a)/(f(b)-f(a));
  if (f(a)*f(c))<0
    b=c;
  endif
    if (f(c)*f(b))<0
    a=c;
    endif
[k c f(c)]
endwhile
