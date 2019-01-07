%engr391project.m
syms x;
trueans = vpa(int(exp(-x^2),x,0,1)); %true value of integral
error = inf;
tol = 10^(-16); %the tolerance chosen by the user
k = 1; %# of rounds
n = 1; %initial # of segments

while error > tol
    table = romberg_integration(k,n);
    result = table(1,length(table));
    error = calerror(trueans,result);
    k = k + 1;
end

result %the best answer
error % the associated error with the best answer

errortable = zeros(k-1,k-1);
%matrix with each error
for i = 1:k-1
    for j = 1:k-1
        errortable(i,j) = calerror(trueans,table(i,j));
    end
end

figure;
%plot the errors
for c = 1:length(errortable)
    line = errortable(:,c);
    line=line(line~=1);
    rounds = zeros(length(line));
    %array of rounds for plot
    for i = 1: length(rounds)
        rounds(i) = i;
    end
    semilogy(rounds,line);
    hold on;
end

title('true relative error vs k rounds');
xlabel('i');
ylabel('true relative error');
hold off;

preverror = inf; %initial previous error
newerror = 1000; % initial new error
index = 1;
errorline = []; %error points for plotting

while newerror < preverror
    preverror = newerror;
    integral = simpson13(@expfunction,0,1,(2^(index-1)));
    newerror = calerror(trueans,integral);
    errorline(index) = newerror;
    index = index + 1;
end

figure;
%plot errorline
segments = zeros(length(errorline));
%array of segments for plot
for i = 1: length(segments)
    segments(i) = 2^(i-1);
end
semilogy(segments,errorline);
title('true relative error vs number of segments');
xlabel('number of segments');
ylabel('true relative error');





