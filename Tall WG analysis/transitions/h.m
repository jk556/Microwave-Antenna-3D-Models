a=0.02286;
b=0.008:0.001:0.2275;
fc=6.557*10^9;
eta=120*pi;
sigma=5.98*10^7;
f=10.3*10^9;
omega =2*pi*f;
mu=4*pi*10^-7;
c=3*10^8;
delta =sqrt(2)/sqrt(omega*mu*sigma);
A=(f/fc)^2 +((2.*b)/a);
B=sqrt((f/fc)^2 -1);
C=1./(sigma*delta.*b*eta);
D=fc/f;
alphac=(C.*D.*A)./B;
figure(1)
plot(b,alphac)
grid on 
xlim
xlabel('b(mm)')
ylabel('\alpha_C (Nep/m)')
title '\alpha_C vs b for TE_1_0'
F=[];
for n=1:5
    for m=0:5
       
fcmn=150*sqrt((m/22.86)^2 +(n/30.48)^2);
      if(fcmn<=12.4)
     fprintf('cut-off frequency for m=%d and n=%d is %4.2f GHz \n',m,n,fcmn)         
         F=[F;m,n,fcmn];
      end
    end
end

ff=(1:0.01:12.4)*10^9;
beta=zeros(length(F),length(ff));
for i=1:length(F)
    kc=sqrt((F(i,1)/22.86)^2+(F(i,2)/30.48)^2)*pi*10^3;
    k=zeros(1,length(ff));
   for j=1:length(ff)
       k(j)=(2*pi*ff(1,j))/c;
       if(k(j)^2>=kc^2)
       beta(i,j)=sqrt(k(j)^2 - kc^2); 
         if(ff(1,j)==10.3*10^9)
           fprintf("for TE_%d_%d in f=10.3GHz , beta = %4.2f \n",F(i,1),F(i,2),beta(i,j))
         end
       end
   end
    
end
figure(2)
plot(ff,beta(1,:))
title("\beta_"+F(1,1)+"_"+F(1,2)+" with f_c_u_t_ _o_f_f = "+F(1,3)+"GHz")
xlabel('frequency(Hz)')
ylabel('\beta')
grid on
figure(3)
plot(ff,beta(2,:))
title("\beta_"+F(2,1)+"_"+F(2,2)+" with f_c_u_t_ _o_f_f = "+F(2,3)+"GHz")
xlabel('frequency(Hz)')
ylabel('\beta')
grid on
figure(4)
plot(ff,beta(3,:))
title("\beta_"+F(3,1)+"_"+F(3,2)+" with f_c_u_t_ _o_f_f = "+F(3,3)+"GHz")
xlabel('frequency(Hz)')
ylabel('\beta')
grid on
figure(5)
plot(ff,beta(4,:))
title("\beta_"+F(4,1)+"_"+F(4,2)+" with f_c_u_t_ _o_f_f = "+F(4,3)+"GHz")
xlabel('frequency(Hz)')
ylabel('\beta')
grid on
figure(6)
plot(ff,beta(1,:))
hold on
plot(ff,beta(2,:))
plot(ff,beta(3,:))
plot(ff,beta(4,:))
hold off 
grid on
legend("mode"+F(1,1)++F(1,2)+"","mode"+F(2,1)++F(2,2)+"","mode"+F(3,1)++F(3,2)+"","mode"+F(4,1)++F(4,2)+"")
xlabel('frequency(GHz)')
ylabel('\beta')
title 'propagating modes in the interval of 0 to 14GHz'

FF=[];
for n=1:5
    for m=0:5
       
fcmn_Twist=150*sqrt((m/30.48)^2 +(n/22.86)^2);
      if(fcmn_Twist<=12.4)
     fprintf('cut-off frequency for m=%d and n=%d is %4.2f GHz \n',m,n,fcmn_Twist)         
         FF=[FF;m,n,fcmn_Twist];
      end
    end
end
fprintf("twisted: \n")
ff=(1:0.01:12.4)*10^9;
Beta=zeros(length(F),length(ff));
for i=1:length(FF)
    Fkc=sqrt((FF(i,1)/30.48)^2+(FF(i,2)/22.86)^2)*pi*10^3;
    p=0;
    k=zeros(1,length(ff));
   for j=1:length(ff)
       k(j)=(2*pi*ff(1,j))/c;
       if(k(j)^2>=Fkc^2)
       Beta(i,j)=sqrt(k(j)^2 - Fkc^2); 
         if(p==0)
           fprintf("for TE_%d_%d  beta = %4.2f and cutoff frequency =%4.2f \n",FF(i,1),FF(i,2),Beta(i,j),FF(i,3))
         p=1;
         end
       end
   end
    
end
figure(7)
plot(ff,Beta(1,:))
hold on
plot(ff,Beta(2,:))
plot(ff,Beta(3,:))
plot(ff,Beta(4,:))
hold off 
grid on
legend("mode"+FF(1,1)++FF(1,2)+"","mode"+FF(2,1)++FF(2,2)+"","mode"+FF(3,1)++FF(3,2)+"")
xlabel('frequency(GHz)')
ylabel('\beta')
title 'propagating modes in the interval of 0 to 14GHz'