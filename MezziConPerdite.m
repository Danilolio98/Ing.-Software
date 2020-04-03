clear all;
clc;
close all;
eps0=8.854e-12;
mu0=4*pi*1e-7;
eps_r1=1;
epsr_2=4;
eps1=eps_r1*eps0;
E0=2;
f=1e9;
c=1/sqrt(eps0*mu0);
Vp_i=c/sqrt(eps_r1*1);
lambda_i=Vp_i/f;
omega=2*pi*f;
k1=omega*sqrt(eps0*mu0);
periodo=1/f;

z_i=0:(lambda_i/30):5*lambda_i;
t=0:1/(30*f):5*periodo;
vers_E=[1 0 0];
%Fasore campo elettrico incidente
E_i=vers_E(1)*E0*exp((-1*1i)*k1.*z_i);
%Espressione istantanea campo elettrico di un onda incidente
e_i=ones(length(z_i),length(t));
%Riempimento matrice rappresentante l'espressione istantanea
for h=1:length(z_i)
    for j=1:length(t)
        e_i(h,j)=real(E_i(h)*exp(1i*omega*t(j)));
    end
end
%plot del campo elettrico con t fissato, faccio scorrere la prima colonna
%della matrice  in cui z è costante ed uguale a 0
figure(1);
title("Campo elettrico incidente di un'onda piana incidente");
subplot(2,2,1);
plot(t,e_i(:,1))
xlabel("t[s]");
ylabel("Ampiezza");
title("Formula istantanea campo elettrico incidente fissato z");
grid on;
%plot del campo elettrico con z fissato, faccio scorrere la prima riga
%della matrice in cui t è costante ed uguale a 0
subplot(2,2,2);
plot(z_i,e_i(1,:))
xlabel("z[m]");
ylabel("Ampiezza");
title("Fasoredel campo elettrico incidente");
grid on;
%mesh dell'intera matrice rappresentante l'espressione istantanea al
%variare sia del tempo che dello spazio
subplot(2,2,[3,4]);
mesh(z_i,t,e_i)
xlabel("z[m]");
ylabel("t[s]");
zlabel("Ampiezza");
title("Formula istantanea campo elettrico onda incidente");

sigma=1e-2;

eps_2cap=(epsr_2*eps0)+(sigma/(1i*omega));
Eta1=sqrt(mu0/eps0);
Eta2=sqrt((1i*omega*mu0)/((1i*omega*epsr_2*eps0)+sigma));
k_2=omega*sqrt(((epsr_2*eps0)+((sigma)/(1i*omega)))*mu0);

BETA=real(k_2);
ALPHA=imag(k_2);
Tau12=(2*Eta2)/(Eta1+Eta2);
%scrivo i dati del secondo mezzo per verificarne le soluzioni
Vp_t=c/sqrt(epsr_2);
lambda_t=Vp_t/f;

z_t=0:lambda_t/30:5*lambda_t;

%Fasore campo elettrico trasmesso
%E_t=Tau12*E0*(exp(((-1*1i)*BETA).*z_t).*exp((-1*ALPHA).*z_t));
E_t=Tau12*E0*exp(-1*1i*k_2.*z_i);
e_t=ones(length(z_i),length(t));
%Riempimento matrice rappresentante l'espressione istantanea di onda
%trasmessa
for h=1:length(z_i)
    for j=1:length(t)
        e_t(h,j)=real(E_t(h)*exp(1i*omega*t(j)));
    end
end
%plot del campo elettrico con t fissato, faccio scorrere la prima colonna
%della matrice  in cui z è costante ed uguale a 0
figure(2);
title("Campo elettrico di un'onda piana in un mezzo con perdite");
subplot(2,2,1);
plot(z_i,e_t(:,1))
xlabel("z[m]");
ylabel("Ampiezza");
title("Fasore del campo elettrico trasmesso");
grid on;
%plot del campo elettrico con z fissato, faccio scorrere la prima riga
%della matrice in cui t è costante ed uguale a 0
subplot(2,2,2);
plot(t,e_t(1,:))
xlabel("t[s]");
ylabel("Ampiezza");
title("Formula istantanea campo elettrico trasmesso fissato z");
grid on;
%mesh dell'intera matrice rappresentante l'espressione istantanea al
%variare sia del tempo che dello spazio
subplot(2,2,[3,4]);
mesh(t,z_i,e_t)
ylabel("z[m]");
xlabel("t[s]");
zlabel("Ampiezza");
title("Formula istantanea campo elettrico onda trasmessa");
