%for fixed e and l, r probably won't change much
clear;
clc;

m_size = linspace(2, 20,10);
r_size = linspace(2, 20, 10);

es = [];
r = [];

e = 1e-15;
l = 10;


figure
for j = 1:length(l)
    ell = l;
    x = linspace(-1,1,ell+1).';
    A = zeros(ell+1,ell+1);
    for i=0:ell
       A(:,i+1) =  x.^i;
    end

    for k = 1:length(r_size)
    [Ua, Sa, Va] = fast_rand_svd(A, r_size(1,k), e);

    es = [es e];
    r = [r r_size(1,k)];
%     semilogy(r_size(1,k), es, 'bo');
%     drawnow;
%     hold on;        

    end
    
    
    
    semilogy(r, es, 'o');
    drawnow
    hold on;
    es
    r
    es = [];
    r = [];
    
%     tic 
%     [U,S,V] = svd(A); 
%     t = toc;
%     
%     
%     scatter(50, t,  'blackx');
%     drawnow;

end


A2 = Ua*Sa*Va'

norm(A-A2)./norm(A)



