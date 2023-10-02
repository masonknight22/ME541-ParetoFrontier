% Define the utility level
utility_level = 7;

% Create an array of w values
w_values = linspace(0, 10, 100);

% Calculate corresponding c values for the indifference curve
c_values_upper = sqrt(w_values.^2 - utility_level); % Upper half of the hyperbola
c_values_lower = -sqrt(w_values.^2 - utility_level); % Lower half of the hyperbola

% Plot the indifference curve
figure;
plot(w_values, c_values_upper, 'b', 'LineWidth', 2);
hold on;
plot(w_values, c_values_lower, 'b', 'LineWidth', 2);
xlabel('Load (w)');
ylabel('Cost (c)');
title(['Indifference Curve for v3: v3(w, c) = ', num2str(utility_level)]);
grid on;
