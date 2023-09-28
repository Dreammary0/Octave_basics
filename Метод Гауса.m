##Поиск СЛАУ методом Гауса

clear all
n=4;
A = [  1 -5 -7  1 ; 
       1 -3 -9 -4 ; 
      -2  4  2  1 ; 
      -9  9  5  3 ];
     
B=[-75 -41 18 29]' ;
X=A^(-1)*B;
ab= cat(2,A,B)
ab0=ab;
for j=1:1:(n-1)
  for i=(j+1) :1:n
    for k=1:1:(n+1)
      ab0(i,k)= ab(j,k)*ab(i,j)/ab(j,j)-ab(i,k) ;
  endfor
  ab=ab0;
  endfor
endfor


for j=n:(-1):2
  for i=(j-1) :(-1):1
    for k=1:1:(n+1)
      ab0(i,k)= ab(j,k)*ab(i,j)/ab(j,j)-ab(i,k) ;
  endfor
  ab=ab0;
  endfor
endfor


for j=1:1:n
    for k =1:1:(n+1)
      ab0(j,k)=ab(j,k)/ab(j,j);
endfor
   ab=ab0
  endfor
  
X

