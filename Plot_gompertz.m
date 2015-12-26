%#! /opt/local/bin/octave -qf
clear all; clf;
%pkg load all;
disp("Plot gompertz v1 24/12/15");
disp("First course on Time Series Analysis, Falk, page 12");
global verbose; verbose = false;

%%---------------------------------------------%
%-------- function gompertz -----------------------%
%----------------------------------------------%
function f_gomp = gompertz(b,x)
	f_gomp = exp(b(1)+b(2)*b(3)^x(:));
end;

%%---------------------------------------------%
%-------- plot gompertz -----------------------%
%----------------------------------------------%
clear;

beta = [1 -1 0.05; 1 -1 0.5; 1 1 0.05; 1 1 0.5];

for i = 1:4
    for j = 1:40
        t(i,j) = j/10;
        fg (i,j) = gompertz(beta(i,:),t(i,j));
    end
end
    
hold on
plot(t(1,:), fg(1,:),'-r')
plot(t(2,:), fg(2,:),'-.g')
plot(t(3,:), fg(3,:),'-.m')
plot(t(4,:), fg(4,:),'-.b')

xlabel('t')
ylabel('f-gompertz(t)')
legend('beta1=1, beta2=-1, beta3=0.05   ',...
       'beta1=1, beta2=-1, beta3=0.5   ',...
       'beta1=1, beta2=1, beta3=0.05   ',...
       'beta1=1, beta2=1, beta3=0.5   ',4);


hold off