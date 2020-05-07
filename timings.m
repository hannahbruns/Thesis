%timing tests to create subplots in thesis

clear;
clc;

sizes = [];

for m=5:5:100
    sizes = [sizes m];
end

ras = [];

dims = [];

sq8 = [];
sq12 = [];

rect8 = [];
rect12 = [];

sqsvd = [];
rectsvd = [];

figure
for j = 1:length(sizes)
    ell = 375;
    x = linspace(-1,1,ell).';
    dim = sizes(1,j);
    A = zeros(ell,dim);
    for i=0:dim
        A(:,i+1) =  x.^i;
    end
        
    %size = sizes(1, i);
    r = 10;
    
    tic;
    fast_rand_svd(A, r, 1e-8);
    time_8 = toc;
    

    tic;
    fast_rand_svd(A, r, 1e-12);
    time = toc;
    
    tic;
    svd(A);
    otime = toc;
    
%     mytimes = [mytimes time]
%     otimes = [otimes otime]
    
    %times = [times time];
    %plot(m_size(1,j), time_8, 'ro');
    ra = rank(A)
    
    ras = [ras ra];
    rect8 = [rect8 time_8];
    rect12 = [rect12 time];
    rectsvd = [rectsvd otime];
    
    
%     subplot(2,2,3)
%     plot(ra, time, 'ro');
%     plot(ra, otime, 'bo');
%     title('Rectangular Vandermonde Matrix');
%     xlabel('Matrix Rank');
%     ylabel('Time (s)');
% 
%      drawnow;
%     hold on;
%     
%     subplot(2,2,4)
%     plot(ra, time_8, 'ro');
%     plot(ra, otime, 'bo');
%     title('Rectangular Vandermonde Matrix');
%     xlabel('Matrix Rank');
%     ylabel('Time (s)') ;
% 
%     
%     
%     drawnow;
%     hold on;
end

subplot(2,2,3)
plot(ras, rect12, 'ro');
drawnow;
hold on;
plot(ras, rectsvd, 'bo');
title('Rectangular Vandermonde Matrix');
xlabel('Matrix Rank');
ylabel('Time (s)');

drawnow;
hold on;

subplot(2,2,4)
plot(ras, rect12, 'ro');
drawnow;
hold on;
plot(ras, rectsvd, 'bo');
title('Rectangular Vandermonde Matrix');
xlabel('Matrix Rank');
ylabel('Time (s)') ;



drawnow;
hold on;


m_size = [];

for m=0:20:1150
    m_size = [m_size m];
end

for j = 1:length(m_size)
    ell = m_size(1,j);
    x = linspace(-1,1,ell+1).';
    A = zeros(ell+1,ell+1);
    for i=0:ell
        A(:,i+1) =  x.^i;
    end
    
    size = m_size(1, j);
    r = 5;
 
    tic;
    fast_rand_svd(A, 10, 1e-8);
    time_8 = toc;
    
    tic;
    fast_rand_svd(A, 10, 1e-12);
    time = toc;
    
    tic;
    svd(A)
    otime = toc;
    
    dims = [dims size];
    sq12 = [sq12 time];
    sq8 = [sq8 time_8];
    sqsvd = [sqsvd otime];
    
    %times = [times time];
    %plot(m_size(1,j), time_8, 'ro');
    
%     subplot(2,2,1);
%     plot(m_size(1,j), time, 'ro');
%     plot(m_size(1,j), otime, 'bo');
%     title('Square Vandermonde Matrix');
%     xlabel('Matrix Dimension'); 
%     ylabel('Time (s)') 
% 
%     
%     drawnow;
%     hold on;
%     
%     subplot(2,2,2);
%     plot(m_size(1,j), time_8, 'ro');
%     plot(m_size(1,j), otime, 'bo');
%     title('Square Vandermonde Matrix');
%     xlabel('Matrix Dimension'); 
%     ylabel('Time (s)');
%     
%     drawnow;
%     hold on;

   
    
    
end

subplot(2,2,1);
plot(dims, sq12, 'ro');
drawnow;
hold on;
plot(dims, sqsvd, 'bo');
title('Square Vandermonde Matrix');
xlabel('Matrix Dimension'); 
ylabel('Time (s)') 


drawnow;
hold on;

subplot(2,2,2);
plot(dims, sq8, 'ro');
drawnow;
hold on;
plot(dims, sqsvd, 'bo');
title('Square Vandermonde Matrix');
xlabel('Matrix Dimension'); 
ylabel('Time (s)');

drawnow;
hold on;

% plot(m_size, times, 'o');
% 
% drawnow
% hold on;
% plot(m_size, time, 'ro');
% plot(m_size, otime, 'bo');
% 
% drawnow;




