% Define the multi-objective optimization problem
fun = @(x) [x(2)*sin(x(1)), x(1) + x(2)];

% Define the search space
x1 = linspace(0, pi, 500);  % Range for x1
x2 = linspace(0, 10, 500);  % Range for x2

% Initialize variables to store Pareto front solutions
paretoFront = [];

% Iterate through the search space
for i = 1:length(x1)
    for j = 1:length(x2)
        x = [x1(i), x2(j)];
        f = fun(x);
        
        % Check if the solution is non-dominated (Pareto optimal)
        isParetoOptimal = true;
        for k = 1:size(paretoFront, 1)
            if all(f >= paretoFront(k, :))
                isParetoOptimal = false;
                break;
            end
        end
        
        % If the solution is Pareto optimal, add it to the Pareto front
        if isParetoOptimal
            paretoFront = [paretoFront; f];
        end
    end
end

% Plot the Pareto front
figure;
scatter(paretoFront(:, 1), paretoFront(:, 2), 'filled');
xlabel('f1(x)');
ylabel('f2(x)');
title('Pareto Frontier (Brute-Force)');
grid on;

% Display Pareto front solutions
fprintf('Pareto Front Solutions:\n');
for i = 1:size(paretoFront, 1)
    fprintf('Solution %d: [%.4f, %.4f]\n', i, paretoFront(i, 1), paretoFront(i, 2));
end

