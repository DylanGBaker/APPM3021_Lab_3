function x = NewtonMethodSystem(F, J, Xo, tol)
errorGreaterThanTol = true;

 while errorGreaterThanTol

     if size(F,1) == 2
        for i = 1:size(F,1)
            temp = F{i};
            temp = temp(Xo(1,1), Xo(2,1));
            f(i, 1) = temp;
        end 

     elseif size(F,1) == 3
        for i = 1:size(F,1)
            temp = F{i};
            temp = temp(Xo(1,1), Xo(2,1), Xo(3,1));
            f(i, 1) = temp;
        end 
     end

     if size(J,1) == 2
         for i = 1:size(J,1)
            for k = 1:size(J,2)
                temp = J{i,k};
                temp = temp(Xo(1,1), Xo(2,1));
                j(i,k) = temp;
            end
         end

     elseif size(J,1) == 3
         for i = 1:size(J,1)
            for k = 1:size(J,2)
                temp = J{i,k};
                temp = temp(Xo(1,1), Xo(2,1), Xo(3,1));
                j(i,k) = temp;
            end
         end
     end

    

     f = f * -1;
     s = gaussMultipleSystems(j, f);
     previous_Xo = Xo;
     Xo = s + Xo;

     %Determine error
     error = Xo - previous_Xo;

     if size(F,1) == 2
         if error(1,1) < tol && error(2,1) < tol
             errorGreaterThanTol = false;
         end
     elseif size(F,1) == 3
         if error(1,1) < tol && error(2,1) < tol && error(3,1) < tol
             errorGreaterThanTol = false;
         end
     end
 end

x = Xo;
end