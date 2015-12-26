%#! /opt/local/bin/octave -qf

clear all; clf;
disp("Plot Logistic function v1 14/12/15");
disp("First course on Time Series Analysis, Falk, page 7");
global verbose; verbose = false;

%%--------------------------------------------%
%-------- logistic function ------------------%
%---------------------------------------------%

clear;

% Data:

beta3 = 1;
beta1 = [0.5 1];
beta2 = [0.1 1];
t = -10;
dx = 0.2;
tx = 1;
data = [0:20/dx];
f_log = [data , beta2, beta1];
f_log = zeros(20/dx,2,2);
txm = zeros(20/dx,1);

for i = 1:2
    for j = 1:2
        while t<=10
            f_log(tx,i,j) = beta3/(1+beta2(i)*exp(-beta1(j)*t));
            txm(tx) = t;
            %fprintf ('%u \n',i, j, tx, f_log(tx,i,j));
            t = t + dx;
            tx = tx+1;
        end
        tx = 1;
        t = -10;
    end
end

% graph:
hold on
plot(txm, f_log(:,1,1),'-r')
plot(txm, f_log(:,1,2),'-.g+')
plot(txm, f_log(:,2,1),'-.m*')
plot(txm, f_log(:,2,2),'-.p')
hold off
title('Logistic function')
xlabel('t')
ylabel('f_{log}(t)')
legend('\beta_1=0.1, \beta_2=0.5, \beta_3=1  ',...
       '\beta_1=1, \beta_2=0.5, \beta_3=1  ',...
       '\beta_1=0.1, \beta_2=1, \beta_3=1  ',...
       '\beta_1=0.5, \beta_2=1, \beta_3=1  ',4);

%---------------------------------------------%