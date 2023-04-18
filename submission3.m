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
%% Question 1b
f = @(x) tan(x) - x;
%found the different intervals by plotting f in matlab.
%Plotted f(x) - g(x) to find the intervals of Io.
first_Io = [-0.0001 1.5];
second_Io = [2 4.5];
third_Io = [6 7.8];
tolerance = 0.00001;
[Root_1] = BisectionSearch(f, tolerance, first_Io);
[Root_2] = BisectionSearch(f, tolerance, second_Io);
[Root_3] = BisectionSearch(f, tolerance, third_Io);

fprintf("Using the bisection method, the roots are " + num2str(Root_1) + ", " + num2str(Root_2) + ", " + num2str(Root_3) + "\n\n\n\n\n");


%% Question 2a
F1 = @(x,y,z) sin(x)+y^2+log(z)-7;
F2 = @(x,y,z) 3*x+2^y-z^3+1;
F3 = @(x,y,z) x+y+z-5;

%Manually formatting the Jacobian by hand.
J1 = @(x,y,z) cos(x);
J2 = @(x,y,z) 2*y;
J3 = @(x,y,z) 1/x;
J4 = @(x,y,z) 3;
J5 = @(x,y,z) 2^y * log(2);
J6 = @(x,y,z) -3*z^2;
J7 = @(x,y,z) 1;
J8 = @(x,y,z) 1;
J9 = @(x,y,z) 1;

F = {F1; F2; F3};
J = {J1 J2 J3; J4 J5 J6; J7 J8 J9};
Xo = [1; 1; 1];
tolerance = 0.00001;

x = NewtonMethodSystem(F, J, Xo, tolerance);

fprintf("The root is: [" + num2str(x(1,1)) + "," + num2str(x(2,1)) + num2str(x(3,1)) + "]\n"); 
%% Question 2b

F1 = @(x,y) x^3 - 3*x*(y^2) - 1;
F2 = @(x,y) 3 * x^2 * y - y^3;

%Manually formatting Jacobian by hand.
J1 = @(x,y) 3*x^2 - 3*y^2;
J2 = @(x,y) -6*x*y;
J3 = @(x,y) 6*x*y;
J4 = @(x,y) 3*x^2 - 3*y;

F = {F1; F2};
J = {J1 J2; J3 J4};
Xo = [-0.6; 0.6];

x = NewtonMethodSystem(F, J, Xo, tolerance);
fprintf("The root is: [" + num2str(x(1,1)) + "," + num2str(x(2,1)) + "]\n"); 
%% Question 2c
F1 = @(x,y) x^2 - x - y;
F2 = @(x,y) (x^2) / 16 + y^2 - 1;

%Manually formatting Jacobian by hand.
J1 = @(x,y) 2*x - 1;
J2 = @(x,y) -1;
J3 = @(x,y) (1/8)*x;
J4 = @(x,y) 2*y;

F = {F1; F2};
J = {J1 J2; J3 J4};
Xo_1 = [-1; 1]; %First root lies somewhere near these points.
Xo_2 = [1; 1]; %Second roots lies somewhere near these points.

%Graph for this question is sent as a picture in the submission.

x1 = NewtonMethodSystem(F, J, Xo_1, tolerance);
x2 = NewtonMethodSystem(F, J, Xo_2, tolerance);
fprintf("\n\n");
fprintf("The roots are: [" + num2str(x1(1,1)) + "," + num2str(x1(2,1)) + "], [" + num2str(x2(1,1)) + "," + num2str(x2(2,1)) + "]\n"); 
end