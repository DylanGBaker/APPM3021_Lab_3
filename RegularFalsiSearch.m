function [root, IterationCount, errorMatrix] = RegularFalsiSearch(f, tol, Io)
%Function that makes use of the Regular Falsi Search iterative method. Uses
%linear interpolation to estimate the root of a non-linear function.
current_c = Io(1,2);
previous_c = Io(1,1);
canUseFalsi = true;
iterationCount = 0;
while (abs(current_c - previous_c)) > tol
    errorMatrix(iterationCount + 1, 1) = (abs(current_c - previous_c));
    previous_c = current_c;
    f_at_a = f(Io(1,1));
    f_at_b = f(Io(1,2));

    if (f_at_b - f_at_a) ~= 0
        current_c = ((Io(1,1) * (f_at_b)) - ((Io(1,2) * (f_at_a)))) / (f_at_b - f_at_a); %Using the false method equation.
    else
        canUseFalsi = false;
        break;
    end
    
    %Check to see what the next iterations points will be.
    if f_at_a * f(current_c) > 0 
        Io(1,1) = current_c;
    elseif f_at_b * f(current_c) > 0
        Io(1,2) = current_c;
    end    

    if abs(current_c) == 0 %Will be dividing by 0.
        canUseFalsi = false;
        break;
    end

    iterationCount = iterationCount + 1;
end
if canUseFalsi
    root = current_c;
    IterationCount = iterationCount - 1;
else
    disp("Dividing by zero and so regular Falsi search cannot be used!");
end
end