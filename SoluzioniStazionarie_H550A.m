clear all;
clc;
close all;



f=700e6;
omega=2*pi*f;
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
T=1/f;
k=(2*pi)/lambda;
z=0:(lambda/50):2*lambda;

I0_A=0;
V0_A=5;

V_a=(V0_A*cos(k.*z))-(1i*z0*I0_A*sin(k.*z));
I_a=(I0_A*cos(k.*z))-(1i*(V0_A/z0)*sin(k.*z));
figure(1);
subplot(2,2,[1,2]);
plot(z,abs(V_a));
xlabel("z[m]");
grid on;
title("Soluzione Stazionaria del modulo della tenzione di una linea aperta");
subplot(2,2,[3,4]);
plot(z,abs(I_a));
xlabel("z[m]");
grid on;
title("Soluzione Stazionaria del modulo della corrente di una linea aperta");
t1=4;
t2=5;
t3=6;
v_1a=abs(real(exp(1i*4.39e9*t1).*abs(V_a)));
v_2a=abs(real(exp(1i*4.39e9*t2).*abs(V_a)));
v_3a=abs(real(exp(1i*4.39e9*t3).*abs(V_a)));
i_1a=abs(real(exp(1i*4.39e9*t1).*abs(I_a)));
i_2a=abs(real(exp(1i*4.39e9*t2).*abs(I_a)));
i_3a=abs(real(exp(1i*4.39e9*t3).*abs(I_a)));
figure(2);
title("Modulo della tensione e della corrente di una linea aperta")
subplot(2,2,[1,2]);
plot(z,v_1a);
hold on;
plot(z,v_2a);
hold on;
plot(z,v_3a);
xlabel("z[m]");
legend("t1","t2","t3");
title("Modulo della tenzione di una linea aperta");
subplot(2,2,[3,4]);
plot(z,i_1a);
hold on;
plot(z,i_2a);
hold on;
plot(z,i_3a);
xlabel("z[m]");
legend("t1","t2","t3");
title("Modulo della corrente di una linea aperta");
%inizializzo V0 e I0 di una linea in cortocircuito
V0_C=0;
I0_C=7;

V_c=(V0_C*cos(k.*z))-(1i*z0*I0_C*sin(k.*z));
I_c=(I0_C*cos(k.*z))-(1i*(V0_C/z0)*sin(k.*z));
figure(3);
subplot(2,2,[1,2]);
plot(z,abs(V_c));
xlabel("z[m]");
grid on;
title("Soluzione stazionaria del modulo della tenzione di una linea in cortocircuito");
subplot(2,2,[3,4]);
plot(z,abs(I_c));
xlabel("z[m]");
grid on;
title("Soluzione stazionaria del modulo della corrente di una linea in cortocircuito");
v_1c=abs(real(exp(1i*4.39e9*t1).*abs(V_c)));
v_2c=abs(real(exp(1i*4.39e9*t2).*abs(V_c)));
v_3c=abs(real(exp(1i*4.39e9*t3).*abs(V_c)));
i_1c=abs(real(exp(1i*4.39e9*t1).*abs(I_c)));
i_2c=abs(real(exp(1i*4.39e9*t2).*abs(I_c)));
i_3c=abs(real(exp(1i*4.39e9*t3).*abs(I_c)));
figure(4);
title("Modulo della tensione e della corrente di una linea in cortocircuito")
subplot(2,2,[1,2]);
plot(z,v_1c);
hold on;
plot(z,v_2c);
hold on;
plot(z,v_3c);
xlabel("z[m]");
legend("t1","t2","t3");
title("Modulo della tenzione di una linea in cortocircuito");
xlabel("z[m]");
subplot(2,2,[3,4]);
plot(z,i_1c);
hold on;
plot(z,i_2c);
hold on;
plot(z,i_3c);
xlabel("z[m]");
legend("t1","t2","t3");
title("Modulo della corrente di una linea in cortocircuito");
