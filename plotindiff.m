% Define parameters
rho = 0.284; 
cost_per_pound = 0.25; 
yield_strength = 120; 

% Define design space ranges
b_range = linspace(0.5, 20, 100);
t_range = linspace(0.5, 12, 100); 
[b_grid, t_grid] = meshgrid(b_range, t_range);

% Calculate load (w) and cost (c) for each (b, t) combination
w_grid = rho * b_grid .* t_grid; 
c_grid = rho * b_grid .* t_grid * cost_per_pound; 
figure;

% Value Function 1
subplot(2, 2, 1);
contour(b_grid, t_grid, w_grid - c_grid, 'LineWidth', 1);
xlabel('Beam Width (b)');
ylabel('Thickness (t)');
title('Indifference Curve for v1');

% Value Function 2
subplot(2, 2, 2);
contour(b_grid, t_grid, w_grid ./ c_grid, 'LineWidth', 1);
xlabel('Beam Width (b)');
ylabel('Thickness (t)');
title('Indifference Curve for v2');

% Value Function 3
subplot(2, 2, 3);
contour(b_grid, t_grid, w_grid.^2 - c_grid.^2, 'LineWidth', 1);
xlabel('Beam Width (b)');
ylabel('Thickness (t)');
title('Indifference Curve for v3');

% Value Function 4
subplot(2, 2, 4);
contour(b_grid, t_grid, w_grid - c_grid + w_grid./c_grid, 'LineWidth', 1);
xlabel('Beam Width (b)');
ylabel('Thickness (t)');
title('Indifference Curve for v4');


hold on;
yield_strength_line = contour(b_grid, t_grid, w_grid, [yield_strength, yield_strength], 'r--', 'LineWidth', 1);
legend(yield_strength_line(1), 'Yield Strength Constraint');

