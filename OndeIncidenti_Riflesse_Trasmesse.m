%il mezzo è non magnetico, implica che la permeabilità magnetica relativa
%è =1
%Algoritmo che mostra l'andamento di un campo elettrico tra due mezzi con
%caratteristiche dielettriche differernti analizzando i casi in cui il
%campo è incidente,riflesso o trasmesso.
%Per ogni campo vengono mostrati due plot, uno che identifica l'andamento
%spaziale ed uno quello temporale, ed un mesh che mostra l'andamento del
%campo dipendente sia dal tempo che dallo spazio.


close all;
eps0=8.854e-12;
mu0=4*pi*1e-7;
eps_r1=2;
epsr_2=5;
eps1=eps_r1*eps0;
eps2=epsr_2*eps0;
E0=5; %AMPIEZZA CAMPO INCIDENTE
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

%Il primo campo studiato è quello incidente, il quale si propaga nel
%1°mezzo ed, a contatto con il secondo mezzo con caratteristiche
%differenti, subisce una separazione in onda trasmessa(che si propaga nel
%2°mezzo) e in onda riflessa(che si propaga nel 1°mezzo, con verso opposto
%a quello incidente.

%ONDA INCIDENTE-----------------------------------------------
%Fasore campo elettrico dell'onda incidente
E_i=E0*exp((-1*1i)*k1.*z_i);
%Espressione istantanea campo elettrico di un onda incidente
e_i=ones(length(z_i),length(t));
%Riempimento matrice rappresentante l'espressione istantanea
for h=1:length(z_i)
    for j=1:length(t)
        e_i(h,j)=real(((E0*exp((-1*1i)*k1*z_i(h))))*exp(1i*omega*t(j)));
    end
end
%plot del campo elettrico con t fissato, faccio scorrere la prima colonna
%della matrice  in cui z è costante ed uguale a 0
figure(1);
title("Campo elettrico di un'onda piana incidente");
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
title("Formula istantanea campo elettrico incidente fissato t");
grid on;
%mesh dell'intera matrice rappresentante l'espressione istantanea al
%variare sia del tempo che dello spazio
subplot(2,2,[3,4]);
mesh(z_i,t,e_i)
xlabel("z[m]");
ylabel("t[s]");
zlabel("Ampiezza");
title("Formula istantanea campo elettrico onda incidente");

%ONDA TRASMESSA----------------------------------------------
%scrivo i dati del secondo mezzo per verificarne le soluzioni
Vp_t=c/sqrt(epsr_2);
lambda_t=Vp_t/f;

z_t=0:lambda_t/30:5*lambda_t;
%calcolo l'impedenza intrinseca del primo e del secondo mezzo
Eta1=sqrt(mu0/eps1);
Eta2=sqrt(mu0/eps2);
%calcolate le impedenze, calcolo il tau12 ossia il coefficente di
%trasmettibilità dell'onda
Tau12=(2*Eta2)/(Eta1+Eta2);


%Espressione istantanea campo elettrico di un onda trasmessa dipendente da
%Tau

e_t=ones(length(z_t),length(t));
%Riempimento matrice rappresentante l'espressione istantanea di onda
%trasmessa
for h=1:length(z_t)
    for j=1:length(t)
        e_t(h,j)=real(((E0*Tau12)*exp((-1*1i)*k2*z_t(h)))*exp(1i*omega*t(j)));
    end
end
%plot del campo elettrico con t fissato, faccio scorrere la prima colonna
%della matrice  in cui z è costante ed uguale a 0
figure(2);
title("Campo elettrico di un'onda piana trasmessa");
subplot(2,2,1);
plot(t,e_t(:,1))
xlabel("t[s]");
ylabel("Ampiezza");
title("Formula istantanea campo elettrico trasmesso fissato z");
grid on;
%plot del campo elettrico con z fissato, faccio scorrere la prima riga
%della matrice in cui t è costante ed uguale a 0
subplot(2,2,2);
plot(z_t,e_t(1,:))
xlabel("z[m]");
ylabel("Ampiezza");
title("Formula istantanea campo elettrico trasmesso fissato t");
grid on;
%mesh dell'intera matrice rappresentante l'espressione istantanea al
%variare sia del tempo che dello spazio
subplot(2,2,[3,4]);
mesh(z_t,t,e_t)
xlabel("z[m]");
ylabel("t[s]");
zlabel("Ampiezza");
title("Formula istantanea campo elettrico onda trasmessa");

%ONDA RIFLESSA---------------------------------------------------
%calcolo gamma per il campo riflesso
gamma12=(Eta2-Eta1)/(Eta2+Eta1);

%calcolo i dati per la verifica della dappresentazione
Vp_r=c/sqrt(eps_r1*1);
lambda_r=Vp_r/f;


e_r=ones(length(z_i),length(t));
%Riempimento matrice rappresentante l'espressione istantanea di onda
%riflessa
for h=1:length(z_i)
    for j=1:length(t)
        e_r(h,j)=real(((E0*gamma12)*exp((1i)*k1*z_i(h)))*exp(1i*omega*t(j)));
    end
end
%plot del campo elettrico con t fissato, faccio scorrere la prima colonna
%della matrice  in cui z è costante ed uguale a 0
figure(3);
title("Campo elettrico di un'onda piana riflessa");
subplot(2,2,1);
plot(t,e_r(:,1))
xlabel("t[s]");
ylabel("Ampiezza");
title("Formula istantanea campo elettrico riflesso fissato z");
grid on;
%plot del campo elettrico con z fissato, faccio scorrere la prima riga
%della matrice in cui t è costante ed uguale a 0
subplot(2,2,2);
plot(z_i,e_r(1,:))
xlabel("z[m]");
ylabel("Ampiezza");
title("Formula istantanea campo elettrico riflesso fissato t");
grid on;
%mesh dell'intera matrice rappresentante l'espressione istantanea al
%variare sia del tempo che dello spazio
subplot(2,2,[3,4]);
mesh(z_i,t,e_r)
xlabel("z[m]");
ylabel("t[s]");
zlabel("Ampiezza");
title("Formula istantanea campo elettrico onda riflessa");