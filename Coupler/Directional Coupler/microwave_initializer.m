clear,clc
%Defining the constants
a = 0.03485;
b = 0.01580;
c = 3e+8;
%Calculating other constants
s = 0.203*a;
freq = 7.025e+9;
lowerFreq = 5.85e+9;
upperFreq = 8.20e+9;
lamda0 = c/freq;
lamdag1 = c/lowerFreq;
lamdag2 = c/upperFreq;
lamdag = 4*(lamdag1*lamdag2)/(2*(lamdag1+lamdag2));
k0 = 2*pi/lamda0;
betta = sqrt(k0^2 - (pi/a)^2);
Z10 = k0*377/betta;
P10 = (a*b)/Z10;
tetta_m = asec(cosh((1/3)*acosh(100)));
Kf = ((2*k0)/(3*377*P10))*((sin((pi*s)/a))^2 - ((2*(betta^2))/(k0^2))*((sin((pi*s)/a))^2 + ((pi^2)/((betta^2)*(a^2)))*(cos((pi*s)/a))^2));
Kb = ((2*k0)/(3*377*P10))*((sin((pi*s)/a))^2 + ((2*(betta^2))/(k0^2))*((sin((pi*s)/a))^2 - ((pi^2)/((betta^2)*(a^2)))*(cos((pi*s)/a))^2));
%Calculating the desired parameters

k = 10^(-(55/20)-log10(abs(Kf)));
r0 = ((k*(sec(tetta_m))^3)/2)^(1/3);
r0 = r0*100;
r1 = (((3*k)*((sec(tetta_m))^3 - sec(tetta_m)))/2)^(1/3);
r1 = r1*100;

disp('---- Important Design Data----');
txt = ['Waveguide Width :' , num2str(a*100) , ' cm'];
disp(txt);
txt = ['Waveguide Height :' , num2str(b*100), ' cm'];
disp(txt);
txt = ['Waveguide Holes radius (r0,r1,r2,r3) :' , num2str(r0) , ' cm ' , num2str(r1) , ' cm ', num2str(r1), ' cm ', num2str(r0), ' cm'];
disp(txt);
txt = ['Holes Distances From Waveguide Edge : ' , num2str(s*1000) , ' mm'];
disp(txt);
txt = ['The Distance Between Holes : ' , num2str(lamdag *100/4) , ' cm' ];
disp(txt);
txt = ['Waveguide Length : ' , num2str(475*lamdag) , ' cm'];
disp(txt);
txt = ['Initial Distance : ' ,num2str(200*lamdag), ' cm'];
disp(txt);
