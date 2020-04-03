clear all;
clc;
close all;



f=500e6;
omega=2*pi*f;
eps0=8.854e-12;
mu0=4*pi*1e-7;
%cavo RG58
eps_r=2.3;
mu_r=1;
l=1;

raggio_e=3.15e-3;
raggio_i=0.9e-3;

C=(2*pi*eps0*eps_r)/log(raggio_e/raggio_i);
L=((mu0*mu_r*l)/(2*pi))*log(raggio_e/raggio_i);

z0=sqrt(L/C);
Vp=1/sqrt(L*C);
lambda=Vp/f;
T=1/f;
k=(2*pi)/lambda;
z=0:(lambda/100):2*lambda;
I0_A=0;
V0_A=5;
V_a=(V0_A*cos(k.*z))-(1i*z0*I0_A*sin(k.*z));
I_a=(I0_A*cos(k.*z))-(1i*(V0_A/z0)*sin(k.*z));
figure(1);
plot(z,abs(V_a));
xlabel("z[m]");
grid on;
title("Soluzione Stazionaria linea aperta del modulo della tensione");
figure(2);
plot(z,abs(I_a));
xlabel("z[m]");
grid on;
title("Soluzione Stazionaria linea aperta del modulo della corrente");
t1=1;
t2=9000e25;
t3=9000e100;
v_1a=abs(real(exp(1i*omega*t1).*abs(V_a)));
v_2a=abs(real(exp(1i*omega*t2).*abs(V_a)));
v_3a=abs(real(exp(1i*omega*t3).*abs(V_a)));

figure(3);
plot(z,v_1a);
hold on;
plot(z,v_2a);
hold on;
plot(z,v_3a);
legend("t1","t2","t3");
title("Espressione istantanea delle soluzioni stazionarie della tensione di una linea aperta");
%inizializzo V0 e I0 di una linea in cortocircuito
V0_C=0;
I0_C=7;

V_c=(V0_C*cos(k.*z))-(1i*z0*I0_C*sin(k.*z));
I_c=(I0_C*cos(k.*z))-(1i*(V0_C/z0)*sin(k.*z));
figure(4);
plot(z,abs(V_c));
xlabel("z[m]");
grid on;
title("Soluzione Stazionaria linea in cortocircuito del modulo della tenzione");
figure(5);
plot(z,abs(I_c));
xlabel("z[m]");
grid on;
title("Soluzione Stazionaria linea in cortocircuito del modulo della corrente");
v_1c=abs(real(exp(1i*omega*t1).*abs(V_c)));
v_2c=abs(real(exp(1i*omega*t2).*abs(V_c)));
v_3c=abs(real(exp(1i*omega*t3).*abs(V_c)));
figure(6);
plot(z,v_1c);
hold on;
plot(z,v_2c);
hold on;
plot(z,v_3c);
legend("t1","t2","t3");
title("Espressione istantanea delle soluzioni stazionarie della tenzione di una linea in cortocircuito");