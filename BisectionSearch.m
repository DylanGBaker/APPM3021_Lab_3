function [root, IterationCount, errorMatrix] = BisectionSearch(f, tol, Io)
current_c = Io(1,2);
previous_c = Io(1,1);
canUseBisection = true;
iterationCount = 0;
while (abs(current_c - previous_c)/ abs(current_c)) > tol
    errorMatrix(iterationCount + 1, 1) = (abs(current_c - previous_c)/ abs(current_c));
    previous_c = current_c;
    f_at_a = f(Io(1,1));
    f_at_b = f(Io(1,2));

    if (f_at_b - f_at_a) ~= 0
        current_c = ((Io(1,1) * (f_at_b)) - ((Io(1,2) * (f_at_a)))) / (f_at_b - f_at_a);
    else
        canUseBisection = false;
        break;
    end

    if f_at_a * f(current_c) > 0
        Io(1,1) = current_c;
    elseif f_at_b * f(current_c) > 0
        Io(1,2) = current_c;
    end

    if abs(current_c) == 0
        canUseBisection = false;
        break;
    end
    iterationCount = iterationCount + 1;
end
if canUseBisection
    root = current_c;
    IterationCount = iterationCount - 1;
else
    disp("Dividing by zero and so bisection search cannot be used!");
end
end