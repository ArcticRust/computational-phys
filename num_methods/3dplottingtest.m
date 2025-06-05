x = linspace(0, 10, 100);
y = x';
z = (x.^(.5)).*(sin(y).^2)./(1.2 + sin(x ./ y));
surf(x, y, z);



