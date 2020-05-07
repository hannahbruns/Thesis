%as l gets too big, it will never change for small e
clear;
clc;

m_size = linspace(2, 100,50);
r_size = linspace(1, 10, 10);
e_size = [1e-10, 1e-11, 1e-12, 1e-13, 1e-14, 1e-15]
%color = ['bo', 'mo' , 'co'];

es = [];
r = [];

e = 1e-14;
l = 10;

figure
for j = 1:length(l)
    ell = m_size(1,j);
    x = linspace(-1,1,ell+1).';
    A = zeros(ell+1,ell+1);
    for i=0:ell
       A(:,i+1) =  x.^i;
    end
    max_it = ell;

    for k = 1:length(r_size)
        
        [Ua, Sa, Va] = fast_rand_svd(A, r_size(1,k), e, max_it);

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



