%calerror.m
%calculate the true relative error
function error = calerror(trueval,approx)
error = abs((trueval - approx) / trueval);
end