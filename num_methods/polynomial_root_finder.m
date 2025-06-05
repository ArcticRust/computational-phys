# [1, 6, 2, 3, 4] ~ 1 + 6x + 2x^2 + 3x^3 + 4x^4
# halley's method !!!!!!
function _ = polynomial_root_finder()
  p0 = [1, 6, -2, 3, 8, -42, 1, 5, -.1];
  a = [];
  for i = -100:.03:100
    a(end + 1) = halleys_method(p0, i);
    i
  endfor
  calc_unique(a)
endfunction

function [xn, x_series] = halleys_method(p0, x0)
  p1 = differentiate(p0);
  p2 = differentiate(p1);
  xn = x0;
  x_series = [x0];
  n = 0;
  max_error = .0001;
  while abs(f(p0, xn)) > max_error
    numerator = f(p0, xn) * f(p1, xn);
    denominator = f(p1, xn).^2 - .5 * f(p0, xn) * f(p2, xn);
    xn = xn - (numerator / denominator);
    n = size(x_series)(2);
    x_series(n + 1) = xn;
  endwhile
  sort(x_series);
endfunction

function ret = calc_unique(a)
  sort(a);
  ret = [a(1)];
  n = size(a)(2);
  error_bound = .001;
  for i = 2:n
    if abs(a(i) - a(i - 1)) > error_bound
      ret(end + 1) = a(i);
    endif
  endfor
endfunction

function p_prime = differentiate(polynomial)
  n = size(polynomial)(2);
  p_prime = zeros(1, n);
  for i = 1:(n - 1)
      p_prime(i) = polynomial(i + 1) * i;
  endfor
endfunction

function px = f(p, x)
  px = 0;
  n = size(p)(2);
  for i = 1:n
    px = px + p(i) .* x.^(i-1);
  endfor
endfunction
