##Задача:
## -14x1 - 6x2 = -78
##-9x1 + 15x2 - x3 = -73
##x2 - 11x3 + x4 = -38
##-7x3 + 12x4 + x5 = 77
##6x4 - 7x5 = 91
##
##A
##-14 -6   0   0    0  | x1 = -78
##-9  15  -1   0    0  | x2 = -73
## 0   1  -11  1    0  | x3 = -38
## 0   0  -7   12   3  | x4 = 77
## 0   0   0   6   -7  | x5 = 91


clear all;
n=5;
a=[0 -9 1 -7 6]';
b=[-14 15 -11 12 -7]';
c=[-6 -1 1 3 0]';
d=[-78 -73 -38 77 91]';
delta(1:1:n)=0;
lamda(1:1:n)=0;
delta(1)=-c(1)/b(1);
lamda(1)= d(1)/b(1);
 for i=2:1:n
   delta(i)=-c(i)/(a(i)*delta(i-1)+b(i));
   lamda(i)=(d(i)-a(i)*lamda(i-1))/(a(i)*delta(i-1)+b(i));
   
 endfor
x(n)=lamda(n);
for i=(n-1):(-1):1
  x(i)=delta(i)*x(i+1)+lamda(i);
endfor



A(1:1:n,1:1:n)=0;
for i=1:1:(n-1)
  A(i+1,i)=a(i+1);
  A(i,i)=b(i);
  A(i,i+1) = c(i);
endfor
A(n,n)=b(n);

A^(-1)*d
x