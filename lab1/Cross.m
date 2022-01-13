function z = Cross(x, y)
z = -0.0001 * (abs(sin(x).*sin(y).*exp(abs(100-(sqrt(x.*x+ y.*y)/pi))))+1).^0.1;
end
