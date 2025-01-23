clc; clear all;

c0 = 3e8;
gamma = 2.8e6;
epsilon0 = 1/36/pi * 10e-9;
mu0 = 4*pi*10e-7;

epsilon_r = 12;

epsilon = epsilon0 * epsilon_r;


psi1 = 0.35; % c = psi1 * a
psi2 = 0.1;  % t = psi2 * a


f_lower = 12e9;
f_upper = 18e9;
f = 15e9;


landa = 2*pi/230;
ll = 3/4*landa;


d = c0 / 2 / f_lower;

a = 1 / (1-psi1-psi2) * d;
c = psi1 * a;
t = psi2 * a;

b = 1 / sqrt((2*f_upper / c0)^2 - (1/a)^2);

delta_f = 0.75 * f;

w0 = (f - delta_f/2)^2 / (f + delta_f);
wm = f + delta_f - w0;
w = 2 * pi * f;


H0 = w0 / 2 / pi / gamma;
Ms = wm / 2 / pi / gamma / 4 / pi;


 
mu = 1 + (w0*wm)/(w0^2 - w^2);
k = (w*wm)/(w0^2 - w^2);

mu_e = (mu^2 - k^2) / mu;

k0 = w/c0;
    
ka = pi / d;


fprintf('a = %.20f\n', a*1000);
fprintf('b = %.20f\n', b*1000);
fprintf('t = %.20f\n', t*1000);
fprintf('c = %.20f\n', c*1000);
fprintf('ll = %.20f\n', ll*1000);


