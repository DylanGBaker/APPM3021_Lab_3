function DrawGraphForQuestion2C
f1 = @(x,y) x^2 - x - y;
fsurf(f1);
hold on
f2 = @(x,y) ((x^2)/16) + y^2 - 1;
fsurf(f2);
xlabel("x-axis")
ylabel("y-axis")
zlabel("z-axis")
hold off
end