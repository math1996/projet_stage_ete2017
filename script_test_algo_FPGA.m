%script de test d'implémentation de l'algo de retrait de la courbe de fond
%pour immplémentation sur FPGA

%paramètres
ordre = 4;
q1 = 1;
q2 = 1;

%généation de la courbe de test
signal_temps = 0.01:0.01:2.5;
p_signal = [4 1 -2 -3 -2 33];
signal = polyval(p_signal,signal_temps);
gauss1 = gaussmf(signal_temps, [0.2 0.5]);
gauss2 = gaussmf(signal_temps, [0.2 2.1]);
gauss3 = gaussmf(signal_temps, [0.2 1.5]);
signal_gauss = signal + 100*gauss1 + 100*gauss2 + 100*gauss3;
figure
plot(signal_temps, signal_gauss);

%%%analyse de la dérivée%%%
premier_point = signal_gauss(1:50);
dernier_point = signal_gauss(201:250);
seuil_d1 = q1*0.02*(signal_gauss(1,250)- signal_gauss(1,1));
seuil_d2 = -q2*0.0018*(signal_gauss(1,250)- signal_gauss(1,1))

%matrice utiles pour approx poly pour la dérivée
A = [];
for i = 1:50
    for j = 0:ordre
        A(i,j+1) = signal_temps(1,i)^(5-j);
    end
end

w = ones(1,50);
W = diag(w);

G1 = A*inv(A'*W*A)*A'*W;
P_premier_point = G1*premier_point';
P_dernier_point = G1*dernier_point';

%affichage de l'approximation
figure
plot(signal_temps, signal_gauss, signal_temps(1:50), P_premier_point, signal_temps(201:250), P_dernier_point);

%application de la dérivée première et seconde pour la première partie
derive1_p1 = [];
derive1_p2 = [];
derive2_p1 = [];
derive2_p2 = [];

%à 1 si on est en dessous du seuil, sinon à 0
comparaison_seuil1_p1 = zeros(1,49);
comparaison_seuil1_p2 = zeros(1,49);

%à 1 si on dépasse le seuil
comparaison_seuil2_p1 = 0;
comparaison_seuil2_p2 = 0;

for i = 1:49
   %premiers points
   derive1_p1(1, i) = P_premier_point(i+1,1) - P_premier_point(i,1);
   if(derive1_p1(1,i) < seuil_d1)
       comparaison_seuil1_p1(1,i) = 1;
   end
   
   %derniers points
   derive1_p2(1, i) = P_dernier_point(i+1,1) - P_dernier_point(i,1);
   if(derive1_p2(1,i) < seuil_d1)
       comparaison_seuil1_p2(1,i) = 1;
   end
end

for i = 1:48
    %premiers points
    derive2_p1(1,i) = derive1_p1(1,i+1) - derive1_p1(1,i);
    if(derive2_p1(1,i) < seuil_d2)
        comparaison_seuil2_p1 = 1;
    end
    
    %derniers points
    derive2_p2(1,i) = derive1_p2(1,i+1) - derive1_p2(1,i);
    if(derive2_p1(1,i) < seuil_d2)
        comparaison_seuil2_p2 = 1;
    end
end

if(comparaison_seuil2_p1 == 1)
    [~, indice_min] = min(abs(derive2_p1))
end

if(comparaison_seuil2_p2 == 1)
    [~, indice_min] = min(abs(derive2_p2))
end

%tronquer les valeurs de début et de fin en utilisant l'indice et la
%comparaison de la dérivée première

%faire l'apprixmation itérative de la courbe de fond
%comparer les résultats <a ceux de Jessy



