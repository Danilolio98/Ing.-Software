clear all;
close all;
clc;
%Linea adatta

f=800e6;
V_pos=5;%V+ delle Soluzioni Viaggianti
omega=700e6;
eps0=8.854e-12;
mu0=4*pi*1e-7;
%cavo H550A++
eps_r=2.3;
mu_r=1;
l=1;
raggio_e=5.5e-3;
raggio_i=0.82e-3;

C=(2*pi*eps0*eps_r)/log(raggio_e/raggio_i);
L=((mu0*mu_r*l)/(2*pi))*log(raggio_e/raggio_i);

z0=sqrt(L/C);
Vp=1/sqrt(L*C);
lambda=Vp/f;
k=(2*pi)/lambda;
z=0:(lambda/30):5*lambda;


V1=V_pos*exp((-1*1i)*k.*z);
I_pos=V_pos/z0;

%Soluzione Viaggiante della Corrente e della Tensione diretta
I1=I_pos*exp((-1*1i)*k.*z);

figure(1);
subplot(2,1,1);
plot(z,real(V1));
grid;
xlabel("z[m]");
title("Soluzione Viaggiante della Tensione diretta");
subplot(2,1,2);
plot(z,real(I1));
grid;
xlabel("z[m]");
title("Soluzione Viaggiante della Corrente diretta");