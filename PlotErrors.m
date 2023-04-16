function PlotErrors
f = @(x) exp(x) + 2^-x + 2*cos(x) - 8;
Io = [1 3];
Xo = 2;
tolerance = 0.00001;

[~, IterationCount, ErrorMatrix] = BisectionSearch(f, tolerance, Io);
t1 = 1:IterationCount + 1;
y1 = ErrorMatrix(:,1);
plot(t1, y1);

hold on

[~, IterationCount, ErrorMatrix] = RegularFalsiSearch(f, tolerance, Io);
t2 = 1:IterationCount + 1;
y2 = ErrorMatrix(:,1);
plot(t2, y2);

[~, IterationCount, ErrorMatrix] = NewtonMethodScaler(f, Xo, tolerance);
t3 = 1:IterationCount + 1;
y3 = ErrorMatrix(:,1);
plot(t3, y3);

hold off

end