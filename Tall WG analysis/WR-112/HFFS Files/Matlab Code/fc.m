a = 28.5;b=12.62;c=3*10^8;
m = 0:10;n=0:10;
for i=1:11
    for j=1:11
        f(i,j) = c/2*sqrt((m(i)/a)^2+(n(j)/b)^2);
    end
end