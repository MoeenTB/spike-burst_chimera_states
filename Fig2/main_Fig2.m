clearvars, close all
%% Parameters
run_time = 6;
deltaT = 0.001;
p = 4/6;

N = 1000; % Number of coupled oscillators
R = 0:5:50;
g_ex = 0:5e-11:0.5e-9;

%% Initialization
% x_init = (15*rand(N,1)-58)*1e-3;
% y_init = rand(N,1)*70e-12;
% z_init = zeros(N, 1);
% init=vertcat(x_init,y_init,z_init);
% 
% CVi = zeros(size(R, 2), size(g_ex, 2));

load CVi
load T

figure
% for i = 1:size(R, 2)
%     G = connectivity_matrix(N,R(i));
%     for j = 1:size(g_ex, 2)
%         [T, V, ST]=mysolv(@System, 0, run_time, deltaT, init, G, g_ex(j));
% 
%         X_len = length(V(1:N, :));
%         T = T(floor(X_len*p)+1:end);
%         ST = ST(:, floor(X_len*p)+1:end);
% 
%         CVi(i, j) = mean(CV(ST));
%     end
% end
    
% save CVi CVi
% save T T

imagesc(g_ex, flip(R), CVi, [0 1])
ylabel('R','FontName','Times New Roman','fontsize',15)
xlabel('g_{ex}','FontName','Times New Roman','fontsize',15)
colorbar

