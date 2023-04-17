function x = gaussElimination(A,b)
    cannotSolve = false;
    for i = 1:(size(A,1))
        if A(i,i) == 0 % Checking to see if our pivot is equal zero. 
            disp(" Cannot perform Gaussian elimination without partial pivoting"); % If the pivot is equal to zero then Gaussian elimination without pivoting cannot be done due to dividing by zero.
            cannotSolve = true;
            break;
        else 
            for j = 1:(size(A,1))
                if i + j > size(A,1) % Making sure to not go out of the boundaries of the matrix size.
                    break;
                else
                    factor = A(i + j,i)/ A(i,i); % Determining factor using pivot.
                    for k = 1:(size(A,1))
                        A(i + j, k) = ((A(i,k) * factor) - A(i + j, k)) * -1; % Looping through k row and subtracting it by the row with the pivot row. Multiplied by -1 as code kept giving the negative of what i needed.
                    end
                    b(i + j, 1) = ((b(i,1) * factor) - b(i + j, 1)) * -1; % Changing column vector for RHS of the equations after the kth row in the matrix A has been changed. Since I multiplied the above by -1 this also needs to be multiplied by -1
                end
            end
        end
    end
    if cannotSolve == false 
        x = backwardsSubstitution(A,b); %If the system of equations can be solved then output the solutions column vector.
    end  
end