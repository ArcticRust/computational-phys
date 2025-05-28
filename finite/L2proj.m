function L2proj()
  x = 0:.5:4;
  M = create_mass_matrix(x);
  b = create_load_vector(x, @testfunc);
  Pf = M\b;
  testx = 0:.05:4;
  plot(x, Pf, testx, testfunc(testx));

endfunction

function J = simpson_approx(f, x0, x1)
  m = (x0 + x1) / 2;
  J = (f(x0) + 4 * f(m) + f(x1)) * (x1 - x0) / 6;
endfunction

function b = create_load_vector(x, f)
  n = length(x) - 1;
  b = zeros(n + 1, 1);
  for i = 1:n
    h = x(i + 1) - x(i);
    bI = [f(x(i)) ; f(x(i + 1))] * h / 2;
    b(i) = b(i) + bI(1);
    b(i + 1) = b(i + 1) + bI(2);
  endfor
endfunction

function M = create_mass_matrix(x) # x is coords of nodes
  n = length(x) - 1;
  M = zeros(n + 1, n + 1);
  for i = 1:n
    h = x(i + 1) - x(i);
    MI = [2 1 ; 1 2] * h / 6;
    M(i,i) = M(i,i) + MI(1,1);
    M(i,i + 1) = M(i,i + 1) + MI(1,2);
    M(i + 1,i) = M(i + 1,i) + MI(2,1);
    M(i + 1,i + 1) = M(i + 1,i + 1) + MI(2,2);
  endfor
endfunction

function y = testfunc(x)
  y = x.*cos(x);
endfunction

