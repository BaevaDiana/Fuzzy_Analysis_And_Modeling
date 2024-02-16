n=5;
x1 =1:1:5;
x2 = 1:1:5;
y = zeros(n,n);
s=0;
Input = zeros(2,25);
Target = zeros(1,25);
k = 9;
for j=1:n
for i = 1:n
y(i,j) = (x1(j) - 3)^2 + (x2(i)-3)^2 + k*(x1(j)-3)*(x2(i)-3);
s = s +1;
Input(1,s) = x1(j) - 3;
Input(2,s) = x2(i) - 3;
Target(1,s) = (x1(j)-3)^2+(x2(i)-3)^2;
end
end
Input
Target
%surf(x1,x2,y)
%xlable('x1')
%ylable('x2')
%zlable('y')
%title('Target');