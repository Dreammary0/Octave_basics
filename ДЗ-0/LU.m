##Сазонтова Мария
##Б9119 09.03.04прогин(1)
##Вариант 7
##ИДЗ-2
clear all;

A = [  1 -5 -7  1 ; 
       1 -3 -9 -4 ; 
      -2  4  2  1 ; 
      -9  9  5  3 ];
       
B = [ -75 
      -41 
       18 
       29 ];
  
n = 4;

##------------------------------------------------------------------------------
##---------------------------часть1 - метод Гаусса-------------------------------

printf("1 часть\n\n\n")


ab= cat(2,A,B);
ab0=ab;
ModulA1=1;

##Обратная матрица(методом Гаусса)
obr = eye(n); 
AForObr = A;

for i=1:1:n
    diagonal = AForObr(i,i);
      for j=1:1:n
        AForObr(i,j) = AForObr(i,j) / diagonal;
        obr(i,j) = obr(i,j) / diagonal;
      endfor
    for k = (i+1):1:n
        diagonal2 = AForObr(k,i);
          for k1=1:1:n
            AForObr(k,k1) = AForObr(k,k1) - AForObr(i,k1)*diagonal2;
            obr(k,k1) = obr(k,k1) - obr(i,k1)*diagonal2;
          endfor
    end
endfor


for k = (n):-1:2
   for i = (k-1):-1:1
     temp3 = AForObr(i,k);
      for j = 1:1:n
          AForObr(i,j) = AForObr(i,j) - AForObr(k,j)*temp3;
          obr(i,j) = obr(i,j) - obr(k,j)*temp3;
     end
  end
end

obr

##Вычисляем СЛАУ

X1=obr*B;

for j=1:1:(n-1)
  
  for i=(j+1) :1:n
    
    for k=1:1:(n+1)
      ab0(i,k)= ab(j,k)*ab(i,j)/ab(j,j)-ab(i,k) ;
    endfor
    
  ab=ab0;
  endfor

endfor

##Нашли определитель
for i=1:1:n
  ModulA1=ModulA1*ab(i,i);
  endfor
ModulA1

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
   ab=ab0;
  endfor

X1


##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
##---------------------------часть2 - LU----------------------------------------

printf("2 часть\n\n\n")

L = eye(n);
U = eye(n);

X = zeros(n,1);
Y = zeros(n,1);

ModulA=1;


##Ищем L и U
for i = 1:1:n
  
    for j = 1:1:(i-1)
        L(i, j) = A(i, j);
        for k = 1:1:(j-1)
            L(i, j) = L(i, j) - L(i, k)*U(k, j);
        end
        L(i, j) = L(i, j)/U(j, j);
    end
    
    for j = i:1:n
        U(i, j) = A(i, j);
        for k = 1:1:(i-1)
           U(i, j) = U(i, j) - L(i, k)*U(k, j);
        end
    end

end
L
U

##Определитель матрицы А
for i = 1:1:n
        ModulA= ModulA*U(i,i);
        
endfor
ModulA

##Решаем СЛАУ A*X=B

for i = 1:1:n
  L(i,i)=1;
end

Y(1) = B(1);

for i = 2:1:n
  Y(i) = B(i);
    for k = 1:1:i-1
        Y(i) = Y(i)-L(i,k)*Y(k);
    end
end

X(n) = Y(n)/U(n,n);

for i = (n-1):(-1):1
    X(i) = Y(i);
    for k = i+1:1:n
        X(i) = X(i)-U(i,k)*X(k);
    end
    X(i) = X(i)/U(i,i);
end
X

