function _ = louiville_sum()
  data_vec = [];
  curr_sum = 0;
  n = 500000;
  file = fopen('louiville_data.txt', 'w');
  for i = 1:n
    prime_factors = factor(i);
    if mod(size(prime_factors)(2), 2) == 0
      curr_sum = curr_sum + 1;
    else
      curr_sum = curr_sum - 1;
    end
    data_vec(i) = curr_sum;

    fprintf(file, '%i\n', curr_sum);
  endfor

  fclose(file);

  plot(1:n, data_vec);
endfunction
