clearvars, close all
rng(0)
%% Parameters
run_time = 6;
deltaT = 0.001;
p = 4/6;

N = 1000; % Number of coupled oscillators
R = [40 40 40];
g_ex = [0.233e-9 0.241e-9 0.26e-9];

%% Initialization
% x_init = (15*rand(N,1)-58)*1e-3;
% y_init = rand(N,1)*70e-12;
% z_init = zeros(N, 1);
% init=vertcat(x_init,y_init,z_init);
% 
% saverX = zeros(1000, 2001*size(R, 2));
% CVi = zeros(1, size(R, 2));

load X
load CVi
load T

figure
for i = 1:size(R, 2)
%     G = connectivity_matrix(N,R(i));
%     [T, V, ST]=mysolv(@System, 0, run_time, deltaT, init, G, g_ex(i));
%     X = V(1:N, :);
% 
%     X_len = length(V(1:N, :));
%     X = X(1,floor(X_len*p)+1:end);
%     T = T(floor(X_len*p)+1:end);
%     ST = ST(1, floor(X_len*p)+1:end);
%         
%     CVi(i) = CV(ST);
%         
%     saverX(1, (i-1)*2001+1:i*2001) = X;
%     saverT(1, 1:2001) = T;

    X = saverX(:, (i-1)*2001+1:i*2001);
    T = saverT(1, 1:2001);
    
    disp(CVi(i));

    subplot(3, 1, i)
    plot(T, X)
    ylabel('voltage','FontName','Times New Roman','fontsize',15)
    xlabel('t','FontName','Times New Roman','fontsize',15)
end
    
% save X saverX
% save CVi CVi
% save T saverT

