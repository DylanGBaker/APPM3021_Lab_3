function [X, U, C] = gaussMultipleSystems(A, b)
    for i = 1:(size(A,1))
        initialPivot = A(i,i);
        newPivot = initialPivot;
        for p = 1:size(A,1) - 1
            if (i + p) > size(A, 1)
                break;
            else
                if abs(initialPivot) < abs(A(i + p, i)) %Checking to see of their is a value in the column with pivot that has a higher abs value than the pivot.
                    newPivot = A(i + p, i);
                    rowToBeSwappedWith = i + p;                   
                end
            end
        end
        if newPivot ~= initialPivot %This means there is a value with a higher abs value than the pivot so rows must be swapped.
            for z = 1:size(A,1)
                temp = A(i, z);
                A(i,z) = A(rowToBeSwappedWith, z);
                A(rowToBeSwappedWith, z) = temp;
            end
            for u = 1:size(b,2) %Need to swap the elements in the vector on the RHS of the system. 
                temp = b(i, u);
                b(i,u) = b(rowToBeSwappedWith, u);
                b(rowToBeSwappedWith, u) = temp;
            end
        end
        for j = 1:(size(A,1))
            if i + j > size(A,1) % Making sure to not go out of the boundaries of the matrix size.
                break;
            else
                factor = A(i + j,i)/ A(i,i); % Determining factor using pivot.
                if factor == 0
                    break;
                else
                    for k = 1:(size(A,1))
                     A(i + j, k) = ((A(i,k) * factor) - A(i + j, k)) * -1; % Looping through k row and subtracting it by the row with the pivot row.
                    end

                    for c = 1: size(b,2)
                    b(i + j, c) = ((b(i,c) * factor) - b(i + j, c)) * -1; % Changing column vector for RHS of the equations after the kth row in the matrix A has been changed.
                    end
                end

            end
        end
    end
    X = backwardsSubstitution(A,b); %Solutions vector = values obtained from backwards substitution.
    U = A; %Upper triangle matrix = augmentedA.
    C = b; %b vectors after doing gaussian elimination and row swapping.
end