function x = DetermineJacobianOfTwoEquations(F, h, point_one, point_two)
x = (F(point_one + h, point_two + h) - F(point_one, point_two)) / h;
end