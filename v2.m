% Define the utility level
utility_level = 5;

% Create an array of w values
w_values = linspace(1, 100, 100);

% Calculate corresponding c values for the indifference curve
c_values = w_values ./ utility_level;

% Plot the indifference curve
figure;
plot(w_values, c_values, 'b', 'LineWidth', 2);
xlabel('Load (w)');
ylabel('Cost (c)');
title(['Indifference Curve for v2: v2(w, c) = ', num2str(utility_level)]);
grid on;
