# morin problem 1.7

r = 1;
r1 = 0;
r2 = 0;
O = pi / 18;
O1 = 0;
O2 = 0;
t = 0;
g = 9.8;

h = 0.001;

while (r < 2)
  r2 = r * O1 * O1 - g * (1 - cos(O));
  r2 = r2 / 2;
  O2 = (-2 * r1 * O1 / r) - (g * sin(O) / r);

  O1 = O1 + O2 * h;
  r1 = r1 + r2 * h;

  O = O + O1 * h;
  r = r + r1 * h;

  t = t + h;
endwhile
t
# t is approx 8.1426
