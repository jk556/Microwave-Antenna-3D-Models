clc;
close all;
clear all;
f=35*10^9;
c0=299792458;
r=0.1;
a(1)=1;
a(2)=3;
a(3)=5;
a(4)=7;
a(5)=7;
a(6)=5;
a(7)=3;
a(8)=1;
%a(9)=9;
%a(10)=1;
x=0
A=0.48/100;
B=0.29/100;
m=1;
n=0;
lambdao=c0/f*1000;
Kc=((m*pi/A)^(2)+(n*pi/B)^(2))^0.5
beta=(((2*pi*f/c0)^2-(Kc)^2))^0.5;
lambdag=2*pi/beta*1000
sai=-30;

for i=1:length(a)
    x=x+a(i)^2;
end
k=(1-r)/x
for i=1:length(a)
    p(i)=a(i)^2*k;
end
for i=1:length(a)
    sigma=0;
    for j=i:1:length(a)
        sigma=p(j)+sigma;
    end
    g(i)=p(i)/(r+sigma);
end
p=p(:)
g=g(:)
for  i=1:length(a)
   x(i)=1000.*A./pi.*asin(((g(i).*lambdao.*B/(lambdag.*2.09.*A)).^0.5)./cos(pi.*lambdao./2./lambdag));
end
x=x(:)
m=0;
d=(lambdag*lambdao)*(2*m-1)/(2*(-lambdao+lambdag*sin(sai*pi/180)))
Z=2*pi*f/c0*377/beta  



