# learning and testing rk4 for systemsg
# diff eq governed by O2 = -gsin(O0)/l
# setting u0 = O0
# u0(0) = pi / 2
# u1(0) = 0
# setting u1 = O1
# d/dt u1 = -gsin(u0)/l
# d/dt u0 = u1
# d/dt [u0 : u1] = [u1 : -gsin(u0)/l]

u0 = pi / 128;
u1 = 0;

u = [u0 ; u1];

t = 0;

h = 0.000001;
g = 9.81;
l = 1;

epsilon = .0000001; # error

while abs(u(1)) > epsilon
  t = t + h;
  k1 = [u(2) ; -g * sin(u(1)) / l];
  k2 = [u(2) + h * k1(2) / 2 ; -g * sin(u(1) + h * k1(1) / 2) / l];
  k3 = [u(2) + h * k2(2) / 2 ; -g * sin(u(1) + h * k2(1) / 2) / l];
  k4 =  [u(2) + h * k3(2) ; -g * sin(u(1) + h * k3(1)) / l];
  u = u + h * (k1 + 2 * k2 + 2 * k3 + k4) / 6;
endwhile
t
