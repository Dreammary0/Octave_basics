#�9119-09.03.04������ ��������� �����
#������� ���������� ��������� ��������� 
#���������������� ������� ������ �������.
#7. y(x) = sqrt(x)

clear all;
format long;
output_precision(15);

n = 6;
x = [0 6 9 12 15 18]';
y = [1 1 1 1 1 1]';

for i = 1:1:n
  y(i) = sqrt(x(i));
  y(i)
endfor

A = [sum(x.*x) sum(x); sum(x) n];
B = [sum(y.*x) sum(y)]';

X = A^(-1) * B;

##��������, ��� ��� ������� �����
if (AX=B) 
   c="��� �����";
 else 
   c="��� �� ������";
endif
c

##����� �������
k = X(1);
b = X(2);
x2 = (0:1:18);
y2 = k * x2 + b;

plot(x, y,'s','MarkerEdgeColor','k','MarkerSize',10, x2,y2,'-','LineWidth',2)