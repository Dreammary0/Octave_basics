##
##LU-разложения.
##Матрица А = нижняя диагональная матрица * верхняя диагональная матрица 
##

clear all
n=4;
A = [1 2 -2 6; -3 -5 14 13; -2 -4 5 10; 1 2 -2 -2];
L= eye(n);
U(1:1:n,1:1:n)=0;
for i = 1:1:n
  
  for j= (1:1:(i-1)) 
   sum = 0;
   for k=1:1:(j-1)
     sum=sum + L(i,k)*U(k,j);
   endfor
   L(i,j)=(A(i,j)-sum)/U(j,j);
  endfor
  
  for j=1:1:n
 sum=0;
 for k=1:1:(i-1)
   sum = sum+ L(i,k)*U(k,j);
 endfor
 U(i,j)= A(i,j)-sum;
  endfor


endfor
