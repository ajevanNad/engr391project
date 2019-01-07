%romberg_integration.m
%romberg integration
function RI = romberg_integration(Norder,BaseN)
RI = zeros(Norder,Norder); %create matrix of zeros

%calculate the first level integrals
%which is the first column of RI
for idx = 1:Norder
    RI(idx,1) = simpson13(@expfunction,0,1,(2^(idx-1))*BaseN);
end

%calculate every other k level integral
%which are the other columns
for col = 2:Norder
    k = col - 1;
    
    for row = 1:(Norder - col + 1)
        RI(row,col) = ((4^k)*RI(row+1,col-1) - RI(row,col-1)) / (4^k-1);
    end
end

end