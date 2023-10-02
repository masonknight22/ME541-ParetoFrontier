% Define the decision space bounds
x1 = linspace(0, 2 * pi, 100);
x2 = linspace(0, 10, 100);

% Initialize arrays to store objective values
f1_values = zeros(100, 100);
f2_values = zeros(100, 100);

% Calculate objective values for each point in the grid
for i = 1:100
    for j = 1:100
        f1_values(i, j) = x2(j) * sin(x1(i));
        f2_values(i, j) = x1(i) + x2(j);
    end
end

pareto_points = [];
for i = 1:100
    for j = 1:100
        is_pareto = true;
        for k = 1:100
            if (f1_values(k, j) <= f1_values(i, j) && f2_values(k, j) <= f2_values(i, j) && k ~= i)
                is_pareto = false;
                break;
            end
        end
        if is_pareto
            pareto_points = [pareto_points; [x1(i), x2(j)]];
        end
    end
end
scatter(pareto_points(:, 1), pareto_points(:, 2), 'filled');
xlabel('x1');
ylabel('x2');
title('Pareto Frontier (Problem 2)');
grid on;
