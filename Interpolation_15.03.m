clear all
n=4;#колво парабол
x=[1 2 3 4 5]';
y=[3 2.8 2 1 3]';
X(1:1:2*n)=0;
B(1:1:2*n)=0;

for i=1:1:n
B(i)=y(i+1)-y(i);
endfor

A(1:1:2*n,1:1:2*n)=0;

for i=1:1:n
A(i,2*i-1)=x(i+1)-x(i);
A(i,2*i)=(x(i+1)-x(i))^2;
endfor

for i=1:1:(n-1)
A(i+n,2*i-1)=1;
A(i+n,2*i)=2*(x(i+1)-x(i));
A(i+n,2*i+1)=-1;
endfor

#A(2*n,2*n-1)=1;
#A(2*n,2*n)=2*(x(n+1)-x(n));
A(2*n,1)=1;

X=A^(-1)*B';

for i=1:1:n
a(i)=y(i);
b(i)=X(2*i-1);
c(i)=X(2*i);
endfor

k=0;
for i=1:1:n
for x0=x(i):0.01:x(i+1)
k=k+1;
x2(k)=x0;
y2(k)=a(i)+b(i)*(x0-x(i))+c(i)*(x0-x(i))^2;
endfor
endfor

plot(x, y,'s','MarkerEdgeColor','k','MarkerSize',20, x2,y2,'-','LineWidth',2)