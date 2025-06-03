function _ = big_O_analysis()
  file_id = fopen('/Users/christopheraustin/Louiville Sum/louiville_data.txt', 'r');
  data = fscanf(file_id, '%i');
  fclose(file_id);

  n = size(data)(1);
  max_neg = [-1];
  for i = 2:n
    if data(i) < max_neg(i - 1)
      max_neg(i) = data(i);
    else
      max_neg(i) = max_neg(i - 1);
    end
  endfor

  used_range = 1:n;
  log_metric = -15 * (used_range).^(.5)./log(used_range);
  hold on
  plot(1:n, max_neg);
  plot(1:n, log_metric);

  hold off
endfunction
