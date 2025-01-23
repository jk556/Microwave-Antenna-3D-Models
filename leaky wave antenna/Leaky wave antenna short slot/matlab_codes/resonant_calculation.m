clc;
close all;
clear all;


f=35*10^9;
c0=299792458;
A=0.48/100;
B=0.29/100;
%A=23/1000;
%B=10/1000;
m=1;
n=0;
lambdao=c0/f*1000;
Kc=((m*pi/A)^(2)+(n*pi/B)^(2))^0.5
beta=(((2*pi*f/c0)^2-(Kc)^2))^0.5;
lambdag=2*pi/beta*1000

%%
q=0;
a(1)=1;
a(2)=7;
a(3)=21;
a(4)=35;
a(5)=35;
a(6)=21;
a(7)=7;
a(8)=1;
for i=1:length(a)
    q=q+a(i)^2;
end
k=1/q;
for i=1:length(a)
    g(i)=k*a(i)^2;
end
 g


x=1000.*A./pi.*asin(((g.*lambdao.*B/(lambdag.*2.09.*A)).^0.5)./cos(pi.*lambdao./2./lambdag))