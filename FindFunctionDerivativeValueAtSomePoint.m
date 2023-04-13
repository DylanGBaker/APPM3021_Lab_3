function derivative_value = FindFunctionDerivativeValueAtSomePoint(f, h, point)
derivative_value = (f(point + h) - f(point)) / h;
end