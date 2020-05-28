function [V] = multi_d_vand(d, ell, p)
%MULTI_D_VAND Summary of this function goes here
%   Creating a Vandermonde matrix in whatever dimension given.



% ell = 3;
% d = 3;
%ell = d;
M = nchoosek(ell+d,d);
N = length(p);
V = zeros(N,M);
   

if d==2
    x = p(:,1); y = p(:,2);
    cnt = 1;
    for i=0:ell
        for j=0:ell
            if i+j<=ell
                V(:,cnt) = x.^i.*y.^j;
                cnt = cnt+1;
            end
        end
    end
   
elseif d==3
    x = p(:,1); y = p(:,2); z = p(:,3);
    cnt = 1;
    for k = 0:ell
        for l = k:-1:0
            for m=k-l:-1:0
                V(:,cnt) = x.^l.*y.^m.*z.^(k-l-m);
                cnt = cnt+1;
            end
        end
    end    
end

end

