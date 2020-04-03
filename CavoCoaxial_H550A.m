%cavo H550A++
clear all;
clc;

%h= rfckt.coaxial;
h=rfckt.coaxial('OuterRadius',5.5e-3,'InnerRadius',0.82e-3,'EpsilonR',2.3,'LineLength',1)
f=860e6;
analyze(h,f)

z1=getz0(h)


omega=700e6;
eps0=8.854e-12;
mu0=4*pi*1e-7;
eps_r=2.3;
mu_r=1;
l=1;
a=0.82e-3;
b=5.5e-3;


C=(2*pi*eps0*eps_r)/log(b/a);
L=((mu0*mu_r*l)/(2*pi))*log(b/a);

c=1/sqrt(eps0*mu0);
z0=sqrt(L/C)
Vp=1/sqrt(L*C);
VP_per=(100*Vp)/c
k=omega*sqrt(L*C);