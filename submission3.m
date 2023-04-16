function submission3
%% Question 1aI

fprintf("Method \t\t\t\t Root \t\t\t Iteration Count\n");
fprintf("____________________________________________________\n");
fprintf("Bisection \t");

f = @(x) exp(x) + 2^-x + 2*cos(x) - 8;
Io = [1 3];
Xo = 2;
tolerance = 0.00001;

[Root, IterationCount, ~] = BisectionSearch(f, tolerance, Io);
fprintf("\t\t" + num2str(Root) + "\t\t\t\t\t" + num2str(IterationCount) + "\n");
fprintf("\n");

fprintf("False Position \t");

[Root, IterationCount, ~] = RegularFalsiSearch(f, tolerance, Io);
fprintf("\t" + num2str(Root) + "\t\t\t\t\t" + num2str(IterationCount) + "\n");
fprintf("\n");

fprintf("Newton \t");

[Root, IterationCount, ~] = NewtonMethodScaler(f, Xo, tolerance);
fprintf("\t\t\t" + num2str(Root) + "\t\t\t\t\t " + num2str(IterationCount) + "\n");

fprintf("\n");
fprintf("\n");
fprintf("\n");
fprintf("\n");
%% Question 1aII
fprintf("Method \t\t\t\t Root \t\t\t Iteration Count\n");
fprintf("____________________________________________________\n");
fprintf("Bisection \t");

f = @(x) 1 - ((2)/(x^2 - 2*x + 2));
Io = [-1 1];
Xo = 0.1;
tolerance = 0.00001;

[Root, IterationCount] = BisectionSearch(f, tolerance, Io);
fprintf("\t\t" + num2str(Root) + "\t\t\t\t\t" + num2str(IterationCount) + "\n");
fprintf("\n");

fprintf("False Position \t");

[Root, IterationCount] = RegularFalsiSearch(f, tolerance, Io);
fprintf("\t" + num2str(Root) + "\t\t\t\t\t" + num2str(IterationCount) + "\n");
fprintf("\n");

fprintf("Newton \t");

[Root, IterationCount] = NewtonMethodScaler(f, Xo, tolerance);
fprintf("\t\t\t " + num2str(Root) + "\t\t\t\t\t" + num2str(IterationCount) + "\n");

fprintf("\n");
fprintf("\n");
fprintf("\n");
fprintf("\n");
%% Question 1aIII

fprintf("Method \t\t\t\t Root \t\t\t Iteration Count\n");
fprintf("____________________________________________________\n");
fprintf("Bisection \t");

f = @(x)besselj(0,x);
Io = [0 15];
Xo = 14.5;
tolerance = 0.00001;

[Root, IterationCount] = BisectionSearch(f, tolerance, Io);
fprintf("\t\t" + num2str(Root) + "\t\t\t\t\t" + num2str(IterationCount) + "\n");
fprintf("\n");

fprintf("False Position \t");

[Root, IterationCount] = RegularFalsiSearch(f, tolerance, Io);
fprintf("\t" + num2str(Root) + "\t\t\t\t\t" + num2str(IterationCount) + "\n");
fprintf("\n");

fprintf("Newton \t");

[Root, IterationCount] = NewtonMethodScaler(f, Xo, tolerance);
fprintf("\t\t\t" + num2str(Root) + "\t\t\t\t\t" + num2str(IterationCount) + "\n");

fprintf("\n");
fprintf("\n");
fprintf("\n");
fprintf("\n");

%% Question 1aIV

PlotErrors();

fprintf("\n");
fprintf("\n");
fprintf("\n");
fprintf("\n");

%% Question 1b
f = @(x) tan(x) - x;
%found the different intervals by plotting f in matlab.

first_Io = [-0.0001 1.5];
second_Io = [2 4.5];
third_Io = [6 7.8];
tolerance = 0.00001;
[Root_1] = BisectionSearch(f, tolerance, first_Io);
[Root_2] = BisectionSearch(f, tolerance, second_Io);
[Root_3] = BisectionSearch(f, tolerance, third_Io);

fprintf("Using the bisection method, the roots are " + num2str(Root_1) + ", " + num2str(Root_2) + ", " + num2str(Root_3) + "\n");


%% Question 2a

%% Question 2b
%% Question 2c

end