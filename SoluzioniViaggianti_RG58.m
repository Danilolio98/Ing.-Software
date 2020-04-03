clear all;
clc;
close all;



f=700e6;
V_pos=5;%V+ delle Soluzioni Viaggianti
omega=700e6;
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
k=(2*pi)/lambda;
z=0:(lambda/30):5*lambda;

%Soluzione Viaggiante della Tensione diretta
V1=V_pos*exp((-1*1i)*k.*z);
figure(1);
plot(z,real(V1));
grid;
xlabel("z[m]");
title("Soluzione Viaggiante della tensione diretta");

I_pos=V_pos/z0;

%Soluzione Viaggiante della Corrente diretta
I1=I_pos*exp((-1*1i)*k.*z);
figure(2);
plot(z,real(I1));
grid;
xlabel("z[m]");
title("Soluzione Viaggiante della Corrente diretta");

%Assumo V- arbitrariamente assegnandogli il valore di 2.5 V
%
%V_neg=2.5;
%E di conseguenza I- assumerà il valore di:
%I_neg=-1*(V_neg/z0);

%Implemento la Soluzione Viaggiante della Tensione prendendo in
%considerazione anche la parte riflessa.
%V=V_pos*exp((-1*1i)*k.*z)+(V_neg*exp(1i*k.*z));

%figure(3);
%plot(z,real(V));
%grid;
%xlabel("z[m]");
%title("Soluzione Viaggiante della Tensione");
%%Implemento la Soluzione Viaggiante della Corrente prendendo in
%considerazione anche la parte riflessa.
%I=I_pos*exp((-1*1i)*k.*z)-(I_neg*exp(1i*k.*z));

%figure(4);
%plot(z,real(I));
%grid;
%xlabel("z[m]");
%title("Soluzione Viaggiante della Corrente");

