% Constants and bounds
E = 206e9; % Modulus of elasticity of steel (Pa)
d = 0.3; % Diameter of the support column (m)
t = 0.0127; % Thickness of tank (m)
sigma_yield = 120e3 * 6895; % Yield strength of steel (Pa)
g = 9.8; % Gravitational constant (m/s^2)

% Calculate maximum height (h) without buckling
h_max = 2 * sqrt((E * d^2 * t) / sigma_yield);

% Calculate largest storage capacity design (r)
r_max = 14;

% Additional Pareto solutions
h1 = 12.5;
r1 = 8;

h2 = 11;
r2 = 10;

h3 = 10;
r3 = 12;

h4 = 10;
r4 = 10;

% Calculate volumes (V) for each solution
V_max = (4/3) * pi * r_max^3;
V1 = (4/3) * pi * r1^3;
V2 = (4/3) * pi * r2^3;
V3 = (4/3) * pi * r3^3;
V4 = (4/3) * pi * r4^3;

% Create a figure
figure;
hold on;

% Plot Pareto solutions
scatter(h_max, V_max, 100, 'k', 'filled', 'DisplayName', 'Tallest Tower');
scatter(h1, V1, 100, 'r', 'filled', 'DisplayName', 'Solution 1');
scatter(h2, V2, 100, 'g', 'filled', 'DisplayName', 'Solution 2');
scatter(h3, V3, 100, 'b', 'filled', 'DisplayName', 'Solution 3');
scatter(h4, V4, 100, 'm', 'filled', 'DisplayName', 'Solution 4');

% Label axes
xlabel('Height (h) in meters');
ylabel('Storage Capacity (V) in cubic meters');

% Title and legend
title('Pareto Optimal Designs');
legend('Location', 'Northwest');

% Plot the Pareto frontier (connect solutions with a line)
pareto_h = [h_max, h1, h2, h3, h4, h_max];
pareto_V = [V_max, V1, V2, V3, V4, V_max];
plot(pareto_h, pareto_V, 'k--', 'DisplayName', 'Pareto Frontier');

% Set axis limits and grid
xlim([9, 16]);
ylim([0, 12000]);
grid on;

% Show legend
legend('Location', 'Northwest');
