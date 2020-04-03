%cavo RG58
clear all;
clc;

%h= rfckt.coaxial;
h=rfckt.coaxial('OuterRadius',2.95e-3,'InnerRadius',0.9e-3,'EpsilonR',2.3,'LineLength',1)
f=600e6;
analyze(h,f)

z1=getz0(h)

eps0=8.854e-12;
mu0=4*pi*1e-7;
eps_r=2.3;
mu_r=1;
l=1;
a=0.9e-3;
b=3.15e-3;
f=700e6;

C=(2*pi*eps0*eps_r)/log(b/a);
L=((mu0*mu_r*l)/(2*pi))*log(b/a);

z0=sqrt(L/C)