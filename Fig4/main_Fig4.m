clearvars, close all
%% Parameters
run_time = 6;
deltaT = 0.001;
p = 4/6;

N = 1000; % Number of coupled oscillators
R = [40 24];
g_ex = [0.2e-9 0.46372e-9];

%% Initialization
% x_init = (15*rand(N,1)-58)*1e-3;
% y_init = rand(N,1)*70e-12;
% z_init = zeros(N, 1);
% init=vertcat(x_init,y_init,z_init);
% 
% saverX = zeros(1000, 2001*size(R, 2));
% saverCVi = zeros(1000, 1*size(R, 2));
% saverZ = zeros(1000, 2001*size(R, 2));
% saverT = zeros(1, 2001);

load X
load CVi
load Z
load T

figure
for i = 1:size(R, 2)
%     G = connectivity_matrix(N,R(i));
%     [T, V, ST]=mysolv(@System, 0, run_time, deltaT, init, G, g_ex(i));
%     X = V(1:N, :);
% 
%     X_len = length(X);
%     X = X(:,floor(X_len*p)+1:end);
%     T = T(floor(X_len*p)+1:end);
%     ST = ST(:, floor(X_len*p)+1:end);
% 
%     CVi = CV(ST);
%     Z = Zp(ST, 5);
%     
%     saverX(:, (i-1)*2001+1:i*2001) = X;
%     saverCVi(:, i) = CVi;
%     saverZ(:, (i-1)*2001+1:i*2001) = Z;
%     saverT(1, 1:2001) = T;
    
    X = saverX(:, (i-1)*2001+1:i*2001);
    CVi = saverCVi(:, i);
    Z = saverZ(:, (i-1)*2001+1:i*2001);
    T = saverT(1, 1:2001);

    subplot(3, 2, i)
    imagesc(flip(X(:,1:500)'), [-60e-3 -35e-3])
    if (i==1)
        ylabel('t','FontName','Times New Roman','fontsize',15)
    end
    colorbar
    subplot(3, 2, i+2)
    imagesc(flip(Z(:, 1:500)'), [0.9 1])
    if (i==1)
        ylabel('t','FontName','Times New Roman','fontsize',15)
    end
    colorbar
    subplot(3, 2, i+4)
    plot(CVi, 'r', 'LineWidth', 2)
    ylim([0 1])
    if (i==1)
        ylabel('CV_i','FontName','Times New Roman','fontsize',15)
    end
    xlabel('i','FontName','Times New Roman','fontsize',15)
end

%     save X saverX
%     save CVi saverCVi
%     save Z saverZ
%     save T saverT