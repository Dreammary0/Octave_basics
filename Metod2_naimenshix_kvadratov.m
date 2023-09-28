clear all;

##Аппроксимируем кривую y=ax^2+bx+c
clear all;
x=(1:1:14)';
y=[2 3 2 2 4 3 4 3 4 6 4 4 6 6]';
n=14;
N=2;

for i=1:1(N+1)
for j=1:1:(N+1)
A(i,j)=2*N-i-j+2;
endfor
endfor