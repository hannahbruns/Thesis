
clc;
clear;

%number of pages
z = 5;

A=[];

for j=1:z
    ell = 3;
    x = linspace(-1,1,ell).';
    B = zeros(ell,ell);
    for i=0:ell-1
       B(:,i+1) =  x.^i;
    end
    A = cat(ell,A,B);
    %A(:,:,z) = B;
end

A

%A(:,:,2) = [10 11 12; 13 14 15; 16 17 18];

