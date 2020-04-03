%il mezzo è non magnetico, implica che la permeabilità magnetica relativa
%è =1
eps0=8.854e-12;
mu0=4*pi*1e-7;
eps_r1=2;
epsr_2=5;
eps1=eps_r1*eps0;
eps2=epsr_2*eps0;
E0=5;
f=800e6;
c=1/sqrt(eps0*mu0);
Vp_i=c/sqrt(eps_r1*1);
lambda_i=Vp_i/f;
omega=2*pi*f;
k1=omega*sqrt(eps1*mu0);
k2=omega*sqrt(eps2*mu0);
periodo=1/f;
%creazione vettori z e t
z_i=0:(lambda_i/30):5*lambda_i;
t=0:1/(30*f):5*periodo;

%calcolo l'impedenza intrinseca del primo e del secondo mezzo
Eta1=sqrt(mu0/eps1);
Eta2=sqrt(mu0/eps2);
%calcolate le impedenze, calcolo il tau12 ossia il coefficente di
%trasmettibilità dell'onda
Tau12=(2*Eta2)/(Eta1+Eta2);

%scrivo i dati del secondo mezzo per verificarne le soluzioni
Vp_t=c/sqrt(epsr_2);
lambda_t=Vp_t/f;

z_t=0:lambda_t/30:5*lambda_t;

%versori ik
vers_ki=[0 0 1];
vers_kt=[0 0 1];
vers_kr=[0 0 -1];

%versore campo elettrico incidente
vers_E=[1 0 0];

%calcolo il versore posizione del campo magnetico incidente
vers_Hi=cross(vers_ki,vers_E);

%Fasore campo magnetico incidente
H_i=vers_Hi(2)*(E0/Eta1)*exp(-1*1i*k1.*z_i);
%Espressione istantanea campo magnetico di un onda incidente
h_i=ones(length(z_i),length(t));
%Riempimento matrice rappresentante l'espressione istantanea
for h=1:length(z_i)
    for j=1:length(t)
        h_i(h,j)=real(H_i(h)*exp(1i*omega*t(j)));
    end
end
%plot del campo elettrico con t fissato, faccio scorrere la prima colonna
%della matrice  in cui z è costante ed uguale a 0
figure(1);
title("Campo magnetico incidente");
subplot(2,2,1);
plot(t,h_i(:,1))
xlabel("t[s]");
ylabel("Ampiezza");
title("Formula istantanea campo magnetico incidente fissato z");
grid on;
%plot del campo elettrico con z fissato, faccio scorrere la prima riga
%della matrice in cui t è costante ed uguale a 0
subplot(2,2,2);
plot(z_i,h_i(1,:))
xlabel("z[m]");
ylabel("Ampiezza");
title("Fasore del campo magnetico incidente ");
grid on;
%mesh dell'intera matrice rappresentante l'espressione istantanea al
%variare sia del tempo che dello spazio
subplot(2,2,[3,4]);
mesh(z_i,t,h_i)
xlabel("z[m]");
ylabel("t[s]");
zlabel("Ampiezza");
title("Formula istantanea campo magnetico onda incidente");

%versore campo magnetico trasmesso
vers_Ht=cross(vers_kt,vers_E);
%Fasore campo magnetico trasmesso
H_t=vers_Ht(2)*((Tau12*E0)/Eta2)*exp(-1*1i*k2.*z_t);

h_t=ones(length(z_t),length(t));
%Riempimento matrice rappresentante l'espressione istantanea di onda
%trasmessa
for h=1:length(z_t)
    for j=1:length(t)
        h_t(h,j)=real(H_t(h)*exp(1i*omega*t(j)));
    end
end
%plot del campo elettrico con t fissato, faccio scorrere la prima colonna
%della matrice  in cui z è costante ed uguale a 0
figure(2);
title("Capo magnetico trasmesso");
subplot(2,2,1);
plot(t,h_t(:,1))
xlabel("t[s]");
ylabel("Ampiezza");
title("Formula istantanea campo magnetico trasmesso fissato z");
grid on;
%plot del campo elettrico con z fissato, faccio scorrere la prima riga
%della matrice in cui t è costante ed uguale a 0
subplot(2,2,2);
plot(z_t,h_t(1,:))
xlabel("z[m]");
ylabel("Ampiezza");
title("Fasore del campo magnetico trasmesso");
grid on;
%mesh dell'intera matrice rappresentante l'espressione istantanea al
%variare sia del tempo che dello spazio
subplot(2,2,[3,4]);
mesh(z_t,t,h_t)
xlabel("z[m]");
ylabel("t[s]");
zlabel("Ampiezza");
title("Formula istantanea campo magnetico di un'onda trasmessa");

%calcolo gamma per il campo riflesso
gamma12=(Eta2-Eta1)/(Eta2+Eta1);

%calcolo i dati per la verifica della dappresentazione
Vp_r=c/sqrt(eps_r1*1);
lambda_r=Vp_r/f;

%Versore campo magnetico riflesso
vers_Hr=cross(vers_kr,vers_E);

%Fasore campo magnetico riflesso
H_r=vers_Hr(2)*((gamma12*E0)/Eta1)*exp(1i*k1.*z_i);

h_r=ones(length(z_i),length(t));
%Riempimento matrice rappresentante l'espressione istantanea di onda
%riflessa
for h=1:length(z_i)
    for j=1:length(t)
        h_r(h,j)=real(H_r(h)*exp(1i*omega*t(j)));
    end
end
%plot del campo elettrico con t fissato, faccio scorrere la prima colonna
%della matrice  in cui z è costante ed uguale a 0
figure(3);
title("Campo magnetico riflesso");
subplot(2,2,1);
plot(t,h_r(:,1))
xlabel("t[s]");
ylabel("Ampiezza");
title("Formula istantanea campo magnetico riflesso fissato z");
grid on;
%plot del campo elettrico con z fissato, faccio scorrere la prima riga
%della matrice in cui t è costante ed uguale a 0
subplot(2,2,2);
plot(z_i,h_r(1,:))
xlabel("z[m]");
ylabel("Ampiezza");
title("Fasore del campo magnetico riflesso");
grid on;
%mesh dell'intera matrice rappresentante l'espressione istantanea al
%variare sia del tempo che dello spazio
subplot(2,2,[3,4]);
mesh(z_i,t,h_r)
xlabel("z[m]");
ylabel("t[s]");
zlabel("Ampiezza");
title("Formula istantanea campo magnetico onda riflessa");