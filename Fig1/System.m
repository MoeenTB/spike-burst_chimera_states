function dM = System(t, M, G)
    N = size(G, 1);
    
    V = M(1:N,1);
    w = M(N+1:2*N,1);
    g = M(2*N+1:3*N,1);

    Cm = 200e-12;
    El = -70e-3;
    gl = 12e-9;
    DT = 2e-3;
    VT = -50e-3;
    tau_w = 300e-3;
    a = 2e-9;
    tau_s = 2.728e-3;
    Ii = 500e-12;
    V_REV = 0;


    dM = nan(size(M));
%     e_coupling = G*g;
%     dM(1:N,1)=-w-g+e_coupling;
%     dM(N+1:2*N,1)=V+a*w;
%     dM(2*N+1:3*N,1)=b+(V-c).*g;
           
%     if (M(1) > VT)
%         M(1) = Vr;
%         M(2) = M(2) + b;
%         M(3) = M(3) + g_ex;
%     else
    dM(1:N,1)=(-gl*(V-El) + gl*DT*exp((V-VT)/DT)-w+Ii+(V_REV - V).*(G*g))/Cm;
    dM(N+1:2*N,1)=(a*(V-El)-w)/tau_w;
    dM(2*N+1:3*N,1)=-g/tau_s;
%     end
end