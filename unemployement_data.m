%#! /opt/local/bin/octave -qf
clear all; clf;
disp("Unemployemnent v1 23/12/15");
disp("First course on Time Series Analysis, Falk, page 5");
global verbose; verbose = false;
%%---------------------------------------------%
%-------- Unemployement -----------------------%
%---------------------------------------------%

clear;

% Lectura de Datos:

month = '';
T = 1;
unemplyd = 10;

[month, T, unemplyd] = textread('unemployement_data.dat','%s %u %u');

% Graph:
hold on
plot(T, unemplyd,'-.r+');
title('Unemployement at Germany 1975-1979');
xlabel('t (month)');
ylabel('Unemployed');
axis([0 longmax 0 1])
set(gca, "fontsize", 15, "XLim", [0,60]);
set(gca, "color", 'w');
hold off
%---------------------------------------------%
%---------------------------------------------%
%---------------------------------------------%