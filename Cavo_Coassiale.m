clear all;
clc;

L=227e-9;
C=90.9e-12;
omega=700e6;

Vp=1/sqrt(L*C);
k=omega*sqrt(L*C);
z0=sqrt(L/C);
h=rfckt.coaxial('OuterRadius',3.5e-3,'InnerRadius',0.82e-3,'EpsilonR',2.1,'LineLength',1);
f=800e6;
analyze(h,f)

z0_s=getz0(h);