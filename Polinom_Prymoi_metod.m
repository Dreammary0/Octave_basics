##������������ - ��������� �������������� ������� �� ��������� ���������, 
##��������, ������� �� ��������� ������.
##1. ������ �����
##2. ������� ��������
##3. ������� ������� 

clear all
n=6;
y=[-7 -9 -7 -4 0 -1]';
x=[1 2 3 5 6 7]';

##������ ����� (A*k=y)

for i =1:1:n
   for j=1:1:n
     A(i,j)=x(i)^(j-1);
    
   endfor
endfor
k=A^(-1)*y;
x0=4;
sum=0;
for i=1:1:n
  sum= sum +k(i)*x0^(i-1);
endfor
x0
sum
Y=A*k



