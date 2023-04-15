function [x, IterationCount] = NewtonMethodScaler(f, Xo, tol)
current_Xo = Xo;
previous_Xo = 0;
iterationCount = 0;
while (abs(current_Xo - previous_Xo)) / abs(current_Xo) > tol
    previous_Xo = current_Xo;
    fprime_Value = FindFunctionDerivativeValueAtSomePoint(f, 0.001, current_Xo);
    current_Xo = current_Xo - (f(current_Xo)/ fprime_Value);
    iterationCount = iterationCount + 1;
end
x = current_Xo;
IterationCount  = iterationCount - 1;
end