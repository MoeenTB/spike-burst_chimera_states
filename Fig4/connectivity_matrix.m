function G = connectivity_matrix(N, R)

    a = nan(N, N);
    b = ones(N, 1);
    b(R+2:N-R) = 0;
    a(:, 1) = b;

    for i=2:N
        a(:,i) = circshift(b,i-1);
    end
    a = a - eye(N);
    G=a;
%     if (dgn == true)
%         for i=1:N
%             G(i,i)=-sum(a(i,:));
%         end
%     end

end