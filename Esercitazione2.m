close all;
clear all;
%Inizializziamo i dati partendo dalla sola k, sapendo che il mezzo in cui
%si propaga l'onda è il vuoto.
k=43;
lambda=(2*pi)/k;
esp0=8.854e-12;
mu0=4*pi*1e-7;
c=1/sqrt(esp0*mu0);
f=c/lambda;
omega=2*pi*f;
periodo=1/f;
t=0:1/(30*f):5*periodo;
z=0:(lambda/30):5*lambda;
Ax=1;
Ay=exp(1i*(pi/2));
%Utilizzo le stesse operazioni usate nel codice precedente per il comportamento 
%dei due fasori Ex ed Ey di un'onda diretta,per descrivere il comportamento 
%di un onda piana riflessa prima nel dominio dei Fasori,sovrapponendo i due plot, 
%e successivamente descrivendole nel dominio del tempo attraverso la formula istantanea:
E_menX=Ax*exp(1i*k.*z);
E_menY=Ay*exp(1i*k.*z);

figure(1);
plot(z,real(E_menX))
hold on
plot(z,real(E_menY))
xlabel("z[m]");
ylabel("Ampiezza");
title("Fasore del campo elettrico di un'onda piana riflessa");
legend("E_x","E_y");
grid on;

M_menX=ones(length(z),length(t));
for h=1:length(z)
    for j=1:length(t)
        M_menX(h,j)=real((Ax*exp(1i*k*z(h)))*exp(1i*omega*t(j)));
    end
end
figure(2);
title("Campo elettrico riflesso parallelo all'asse x di un'onda piana");
subplot(2,2,1);
plot(t,M_menX(1,:))
xlabel("t[s]");
ylabel("Ampiezza");
title("Formula istantanea campo elettrico riflesso fissato z");
grid on;
%plot del campo elettrico con z fissato, faccio scorrere la prima riga
%della matrice in cui t è costante ed uguale a 0
subplot(2,2,2);
plot(z,M_menX(:,1))
xlabel("z[m]");
ylabel("Ampiezza");
title("Fasore del campo elettrico riflesso fissato t");
grid on;
%mesh dell'intera matrice rappresentante l'espressione istantanea al
%variare sia del tempo che dello spazio
subplot(2,2,[3,4]);
mesh(z,t,M_menX)
xlabel("z[m]");
ylabel("t[s]");
zlabel("Ampiezza");
title("Formula istantanea del campo elettrico riflesso lungo l'asse x di un'onda piana");


M_menY=ones(length(z),length(t));
for h=1:length(z)
    for j=1:length(t)
        M_menY(h,j)=real((Ay*exp(1i*k*z(h)))*exp(1i*omega*t(j))); 
    end
end
figure(3);
title("Campo elettrico riflesso parallelo all'asse y di un'onda piana");
subplot(2,2,1);
plot(t,M_menY(1,:))
xlabel("t[s]");
ylabel("Ampiezza");
title("Formula istantanea campo elettrico riflesso fissato z");
grid on;
%plot del campo elettrico con z fissato, faccio scorrere la prima riga
%della matrice in cui t è costante ed uguale a 0
subplot(2,2,2);
plot(z,M_menY(:,1))
xlabel("z[m]");
ylabel("Ampiezza");
title("Fasore del campo elettrico riflesso fissato t");
grid on;
%mesh dell'intera matrice rappresentante l'espressione istantanea al
%variare sia del tempo che dello spazio
subplot(2,2,[3,4]);
mesh(z,t,M_menY)
xlabel("z[m]");
ylabel("t[s]");
zlabel("Ampiezza");
title("Formula istantanea del campo elettrico riflesso lungo l'asse y di un'onda piana");