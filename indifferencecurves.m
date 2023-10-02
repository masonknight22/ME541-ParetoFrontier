% Define the utility function as a function handle
utility_function = @(x, y) x - y;

% Specify a utility level 
target_utility = 5;

% Create a grid of x and y values
x_values = linspace(0, 10, 100); 
y_values = linspace(0, 10, 100); 
[X, Y] = meshgrid(x_values, y_values);

% Calculate the utility for each combination of x and y
Z = utility_function(X, Y);

% Plot the indifference curve where U(x, y) = target_utility
contour(X, Y, Z, [target_utility, target_utility], 'LineWidth', 2);

xlabel('x');
ylabel('y');
grid on;

% Optional: Add more contours for different utility levels
% contour(X, Y, Z, [other_utility_1, other_utility_1, other_utility_2, other_utility_2], 'LineStyle', '--');

% Adjust the colormap for better visualization
colormap('jet');
colorbar;


