
%function plot
clear variables

X = [infsup(-10, 10);infsup(-10, 10)];
n = 100;
x_grid = linspace(inf(X(1)), sup(X(1)), n);
y_grid = linspace(inf(X(2)), sup(X(2)), n);
[xx, yy] = meshgrid(x_grid, y_grid);
zz = Booth(xx, yy);
%extr_val = [1.34941, -1.34941;1.34941, 1.34941;-1.34941, 1.34941;-1.34941, -1.34941];
extr_val = [1, 3];
figure
mesh(xx, yy, zz)
colorbar
colormap("winter")
hold on

for i = 1:size(extr_val)
    plot3(extr_val(i, 1), extr_val(i, 2), 0, 'ob', "MarkerSize", 8, "MarkerFaceColor", [1, 0, 0])
    % plot3(extr_val(i, 1), extr_val(i, 2), -2.06261, 'ob', "MarkerSize", 8, "MarkerFaceColor", [1, 0, 0])
end

%title("Cross-in-tray function")
title("Booth function")

%algorithm step plot
figure
contour(xx, yy, zz, 'k')
hold on 
[opt, worklist] = globopt0(X);
opt_int = worklist(1).Box;
min_est = inf;
max_est = inf;
for b = worklist
    if b.Estim < min_est
        opt_int = b.Box;
        min_est = b.Estim;
        max_est = b.EstimUp;
    end
    plotintval(b.Box, 'n')
    hold on
end

%extremum distance plot
extr_val = extr_val';
dist_extr = zeros(1, size(worklist, 2));
rad_bars = dist_extr;
for i=1:size(worklist, 2)
    dist_extr(1, i) = min(vecnorm(extr_val - mid(worklist(i).Box)));
    rad_bars(1, i) = max(rad(worklist(i).Box));
end
figure
semilogy(dist_extr, "LineWidth", 1)
hold on
grid on
title('Extremum distance')
xlabel('Iteration number')
ylabel('Distance')
xlim([0 size(worklist, 2)])

%Bar radius plot
figure
semilogy(rad_bars, "LineWidth", 1)
hold on
grid on
title('Bar radius')
xlabel('Iteration number')
ylabel('Radius')
xlim([0 size(worklist, 2)])
