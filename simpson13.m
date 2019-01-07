%simpson13.m
%multiple segment simpsons 1/3 rule 
function I = simpson13(fnc,a,b,n)

h=(b-a)/n;
s = fnc(a) + fnc(b);

for i=1:2:n-1
    s = s + 4*fnc(a+(i*h)); %f(x_i) for i=1,3,5,7,...,n-1
end

for i=2:2:n-2
    s = s + 2*fnc(a + (i*h)); %f(x_i) for 2,4,6,8,...,n-2
end

I = (h/3)*s;
end