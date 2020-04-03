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
%Creo i due vettori campo elettrico che rappresentano i Fasori del campo
%elettrico lungo l'asse x e l'asse y.
%I due Fasori sono gli stessi, con l'eccezione che Ey è traslato di pi/2
%rispetto l'origine implicando che Ey si comporti come un seno mentre Ex si
%comporta come un coseno.
Ex=Ax*exp((-1*1i)*k.*z);
Ey=Ay*exp((-1*1i)*k.*z);
% creo il plot di Ex ed Ey sovrapposti uno sull'altro per vedere il
% diseallineamento dei due fasori;
figure(1);
plot(z,real(Ex))
hold on
plot(z,real(Ey))
xlabel("z[m]");
ylabel("Ampiezza");
title("Fasori del campo elettrico lungo gli assi x e y");
legend("Ex","Ey");
grid on;
%costruzione della matrice che rappresenta la formula istantanea del campo
%elettrico lungo l'asse x. Utilizziamo la matrice essendo la formula
%istantanea dipendente dalla direzione di propagazione z e dal tempo t.
%Una volta creata la matrice rappresentante la propagazione di un'onda piana diretta 
%grazie alla formula detrivata dalle equazioni di Maxwell, ne creo il
%grafico.
Mx=ones(length(z),length(t));
for h=1:length(z)
    for j=1:length(t)
        Mx(h,j)=real((Ax*exp((-1*1i)*k*z(h)))*exp(1i*omega*t(j)));
    end
end
%plot del campo elettrico con t fissato, faccio scorrere la prima colonna
%della matrice  in cui z è costante ed uguale a 0
figure(2);
title("Campo elettrico incidente parallelo all'asse x di un'onda piana");
subplot(2,2,1);
plot(t,Mx(1,:))
xlabel("t[s]");
ylabel("Ampiezza");
title("Formula istantanea campo elettrico incidente fissato z");
grid on;
%plot del campo elettrico con z fissato, faccio scorrere la prima riga
%della matrice in cui t è costante ed uguale a 0
subplot(2,2,2);
plot(z,Mx(:,1))
xlabel("z[m]");
ylabel("Ampiezza");
title("Fasore del campo elettrico incidente fissato t");
grid on;
%mesh dell'intera matrice rappresentante l'espressione istantanea al
%variare sia del tempo che dello spazio
subplot(2,2,[3,4]);
mesh(z,t,Mx)
xlabel("z[m]");
ylabel("t[s]");
zlabel("Ampiezza");
title("Formula istantanea del campo elettrico incidente lungo l'asse x di un'onda piana");
%Costruzione matrice che rappresenta la formula istantanea del campo
%elettrico lungo l'asse y.
My=ones(length(z),length(t));
for h=1:length(z)
    for j=1:length(t)
        My(h,j)=real((Ay*exp((-1*1i)*k*z(h)))*exp(1i*omega*t(j)));
    end
end
figure(3);
title("Campo elettrico incidente parallelo all'asse y di un'onda piana");
subplot(2,2,1);
plot(t,My(1,:))
xlabel("t[s]");
ylabel("Ampiezza");
title("Formula istantanea campo elettrico incidente fissato z");
grid on;
%plot del campo elettrico con z fissato, faccio scorrere la prima riga
%della matrice in cui t è costante ed uguale a 0
subplot(2,2,2);
plot(z,My(:,1))
xlabel("z[m]");
ylabel("Ampiezza");
title("Fasore del campo elettrico incidente fissato t");
grid on;
%mesh dell'intera matrice rappresentante l'espressione istantanea al
%variare sia del tempo che dello spazio
subplot(2,2,[3,4]);
mesh(z,t,My)
xlabel("z[m]");
ylabel("t[s]");
zlabel("Ampiezza");
title("Formula istantanea del campo elettrico incidente parallela all'asse y di un'onda piana");