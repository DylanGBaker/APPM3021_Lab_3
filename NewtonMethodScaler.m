function [x, IterationCount, errorMatrix] = NewtonMethodScaler(f, Xo, tol)
current_Xo = Xo;
previous_Xo = 0;
iterationCount = 0;
while (abs(current_Xo - previous_Xo)) / abs(current_Xo) > tol
    errorMatrix(iterationCount + 1, 1) = (abs(current_Xo - previous_Xo)) / abs(current_Xo); %Storing error at that iteration so it can be plotted.
    previous_Xo = current_Xo;
    fprime_Value = FindFunctionDerivativeValueAtSomePoint(f, 0.001, current_Xo); %Function that finds the approximate value of the derivative at a point.
    current_Xo = current_Xo - (f(current_Xo)/ fprime_Value); %implementing equation for the newton method.
    iterationCount = iterationCount + 1;
end
x = current_Xo
IterationCount  = iterationCount - 1
end