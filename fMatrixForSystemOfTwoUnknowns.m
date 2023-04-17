function x = fMatrixForSystemOfTwoUnknowns(F, initialX)
%{
for i = 1:size(F,1)
        temp = F{i};
        temp = temp(-0.6,0.6);
        f(i, 1) = temp;
end


for i = 1:size(J,1)
    for j = 1:size(J,2)
        temp = J{i,j};
        temp = temp(-0.6, 0.6);
        jAC(i,j) = temp;
    end
end

[x, ~, ~] = gaussMultipleSystems(jAC, f);
%}
end