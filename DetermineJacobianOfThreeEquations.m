function j = DetermineJacobianOfThreeEquations(F, h, point_one, point_two, point_three)
j = (F(point_one + h, point_two + h, point_three + h) - F(point_one, point_two, point_three)) / h;
end