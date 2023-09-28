clear all;
n=5;
dx=0.1;
x=[0:dx:dx*(n-1)]';
y=sin(x);

dy(1:1:n, 1:1:n)=0;
dy(:,1)=y';
for j=2:1:n
  for i=1:1:(n-j+1)
    dy(i,j)=dy(i+1,j-1)-dy(i,j-1);
  endfor
endfor
dy

a=(sin(0.3)-sin(0.2))/0.1