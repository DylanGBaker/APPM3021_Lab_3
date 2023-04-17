function solutionMatrix = backwardsSubstitution(augmentedA, augmentedB)
    cannotBeSolved = false;
    infinitelyManySolutions = false;
        for i = size(augmentedA,1):-1:1
            for j = size(augmentedA,1):-1:i  %By making j greater than or equal to i it will allow me to move up the triangle and solve for the unknowns.
                for c = 1:size(augmentedB, 2) %This tracks the column for "b" vector if their is multuiple solutions.
                    if j == i && augmentedA(i, i) ~= 0
                        solutionMatrix(i, c) = augmentedB(i, c)/ augmentedA(i, i); %This show the code that we are at the end of the substituion in that row and can divide to determine the unknown.
                    elseif j == i && augmentedA(i,i) == 0 %If this occurs you will divide by zero and so there is no solution.
                        disp("Cannot be solved");
                        cannotBeSolved = true;
                        break;
                    elseif j == i && augmentedA(i,i) == 0 && augmentedB(i,c) == 0
                        disp("There are infinitely many solutions")
                        infinitelyManySolutions = true;
                    else
                        augmentedB(i, c) = augmentedB(i, c) - (augmentedA(i, j) * solutionMatrix(j, c)) ; %This subtracts the values on the LHS of the equation with known numbers.
                    end
                end
                if cannotBeSolved == true %Breaking out the loop if it cannot be solved.
                    break;
                elseif infinitelyManySolutions
                    break;
                end
            end
            if cannotBeSolved == true
                break;
            elseif infinitelyManySolutions
                break;
            end
        end
end
