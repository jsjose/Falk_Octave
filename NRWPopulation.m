%#! /Applications/Octave.app/Contents/MacOS/Octave Ðqf
%%---------------------------------------------%
%-------- NRW Population-----------------------%
%----------------------------------------------%

clear;

% Lectura de Datos:

load 'NRWPopulation.dat'

% calculo de parametros

beta_i(1) = 0
beta_i(2) = 0
beta_i(3) = 10

%beta = nlinfit(Time,pop,@logistic,beta_i);

%[beta,r,J] = nlinfit(reactants,rate,'logistic',beta0);

beta(1) = 0.1675
beta(2) = 1.1436
beta(3) = 21.5016

% aproximaci—n

for i = 1:10
  Popest1(i) = logistic(beta, i);
end

beta(1) = 0.1675
beta(2) = 1.1436
beta(3) = 21.5016

% aproximacion
for i = 1:100
    Time(i) = i;
    Popest2(i) = logistic(beta, i);
end

% representación de datos:

hold on

%plot(Time, pop,'-.r+');
plot(Time, Popest2,'-.g*');
hold off
title('Poblacion en NRW')
xlabel('t (meses)')
ylabel('poblacion en millones')
%axis([0 longmax 0 1])