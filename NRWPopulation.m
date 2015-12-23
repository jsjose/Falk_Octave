%#! /opt/local/bin/octave -qf
clear all; clf;
pkg load all;
disp("NRWPopulation v1 23/12/15");
disp("First course on Time Series Analysis, Falk, page 10");
disp("Dependencies: optim-1.4.1.tar.gz, struct-1.0.11.tar.gz");
global verbose; verbose = false;

%---------------------------------------------%
function [y] = logistic(x,par)
  y = par(3)./(1+par(2)*exp(-par(1)*x));
end;
%logistic = @ (x,par) par(3)./(1+par(2)*exp(-par(1)*x));
%---------------------------------------------%

%%---------------------------------------------%
%-------- NRW Population-----------------------%
%----------------------------------------------%
% Data:
load 'NRWPopulation_dat.dat';

for i = 1:10
  x(i) = NRWPopulation_dat(i,2);
	y(i) = NRWPopulation_dat(i,3); 
end

% initial value
pin = [0.15; 1.14; 21.5];

[Popest2,betas,cvg,iter,corp,covp] = leasqr(x,y,pin,"logistic");

% estimate
for i = 1:10
  Popest1(i) = logistic(i, betas);
end

% graph:
hold on
plot(x, Popest1,'-.r+');
plot(x, y,'.g*');
plot(x, Popest2,'.b*');
title('Population size at NRW');
xlabel('t (month)');
ylabel('population in millions');

%---------------------------------------------%
%---------------------------------------------%
%---------------------------------------------%