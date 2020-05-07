%timing code from plots in proposal doc

clear;
clc;
m_size = [100, 500, 1000, 5000,  10000, 15000, 20000];

% for m=10:50:5000
%     m_size = [m_size m];
% end

times = [];

figure
for j = 1:length(m_size)
    ell = m_size(1,j);
    x = linspace(-1,1,ell).';
    A = zeros(ell,10);
    for i=0:ell
        A(:,i+1) =  x.^i;
    end
    
    size = m_size(1, j);
    r = 10;
 
    tic;
    fast_rand_svd(A, 10, 1e-8);
    time_8 = toc;
    
    if size > 1000
        r = 30;
    end
    tic;
    fast_rand_svd(A, 10, 1e-12);
    time_14 = toc;
    
    tic;
    svd(A)
    otime = toc;
    
    %times = [times time];
    plot(m_size(1,j), time_8, 'ro');
    plot(m_size(1,j), time_14, 'rx');
    plot(m_size(1,j), otime, 'bo');

    drawnow;
    hold on;
    
    
end

% plot(m_size, times, 'o');
% 
% drawnow
% hold on;

