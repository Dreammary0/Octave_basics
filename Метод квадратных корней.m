##
##Метод квадратных корней
##
##16 -8 -4  0 | x1 |   -8
##-8 13 -4 -3 | x2 | =  7
##-4 -4  9  0 | x3 |    6
## 0 -3  0  3 | x4 |   -3

clear all;

 a=[16 -8 -4 0;-8 13 -4 -3;-4 -4 9 0;0 -3 0 3];
 b=[-8 7 6 -3]';
 a^(-1)*b
 
 n=4;
 u(1:1:n, 1:1:n)=0;
 for i=1:1:n
   sum=0;
   for k= 1:1:(i-1)
     sum=sum+u(k,i)*u(k,i); 
   endfor
  u(i,i)=sqrt(a(i,i)-sum);
  
  
   for j=(i+1):1:n
   sum=0;
    for k=1:1:(i-1)
     sum=sum+u(k,i)*u(k,j);
    end
   u(i,j)= (a(i,j)-sum)/u(i,i);
   endfor
 endfor
u'*u
a

 ##AX=B -> U^T*U*X=B -> (U*X=Y) -> U^T * Y=B

for i=1:1:n
sum=0;
  for k=1:1:(i-1)
  sum=sum+u(k,i)*y(k);
  end
y(i)=(b(i)-sum)/u(i,i);
endfor

for i=n:(-1):1
sum=0;
  for k = (i+1):1:n 
  sum=sum+u(i,k)*x(k);
  end
x(i)=(y(i)-sum)/u(i,i);
endfor


