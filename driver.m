%finding the smallest e that works for a set of r and l
clear;
clc;

m_size = linspace(2, 20,10);
r_size = linspace(2, 20, 10);
e_size = [1e-10, 1e-11, 1e-12, 1e-13, 1e-14, 1e-15]

es = [];
r = [];
ls = [];

e = 1e-15;


figure
for j = 1:length(m_size)
    ell = m_size(1, j);
    x = linspace(-1,1,ell+1).';
    A = zeros(ell+1,ell+1);
    for i=0:ell
       A(:,i+1) =  x.^i;
    end
    %we are passing in size of matrix as the max iterations
    %decrease to make it compute faster
    max_it = ell;

    for k = 1:length(r_size)
        %for m = 1:length(e_size)
        try
            [Ua, Sa, Va] = fast_rand_svd(A, r_size(1,k), e, max_it);
        catch
            temp = r_size(1,k)-2;
            if temp ~= 0
                ls = [ls m_size(1,j)];
                r = [r temp];
            end
            break;
               
        end
        %es = [es e];
        r = [r r_size(1,k)];
        ls = [ls m_size(1,j)];
      

    end
    
    
    plot(r, ls, 'o');
    drawnow
    hold on;
    ls
    r
    ls = [];
    r = [];


end


% A2 = Ua*Sa*Va'
% 
% norm(A-A2)./norm(A)



