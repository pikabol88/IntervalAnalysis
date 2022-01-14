
Ainf = [2 -2; -1 2];
Asup = [4 1; 2 4];
binf = [-2; -2];
bsup = [2; 2];


A = kinterval(Ainf,Asup)
b = kinterval(binf,bsup)

xx = [kinterval(-1/3, 1/3); kinterval(-1/3, 1/3)]

Axx = A * xx

x = subdiff(A, b)

Ax = A * x


opts.stepwise = true;

[x_stepwise, opts] = subdiff(A, b, opts);  
x_stepwise 

while ~opts.finish
    [x_stepwise, opts] = subdiff(opts);
    x_stepwise 
end 


