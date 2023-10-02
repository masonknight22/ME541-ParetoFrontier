clc;

clear

 

x0 = [2, 2];

 

A = [];

b = [];

Aeq = [];

beq = [];

 

lb = [0, 0];

ub = [1, 1];

 

figure

hold on;

 

for l=0:0.1:1

    fun = @(x) -l *x(1)^2 + (1-l)* x(2)^2;

    x = fmincon(fun, x0, A, b, Aeq, beq, lb, ub);

    l

    x

    plot(x, '^')

    xlabel('x1')

    ylabel('x2')

end