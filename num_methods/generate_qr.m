function generate_qr()
  info = 'Hello World!';
  info_type = 'binary';

  arr = zeros(29, 29);

  arr(1:7, 1:7) = 1;
  arr(2:6, 2:6) = 0;
  arr(3:5, 3:5) = 1;
  arr(23:29, 1:7) = 1;
  arr(24:28, 2:6) = 0;
  arr(25:27, 3:5) = 1;
  arr(1:7, 23:29) = 1;
  arr(2:6, 24:28) = 0;
  arr(3:5, 25:27) = 1;
  for i = 9:2:23
    arr(7, i) = 1;
    arr(i, 7) = 1;
  endfor
  arr(21:25, 21:25) = 1;
  arr(22:24, 22:24) = 0;
  arr(23, 23) = 1;


  arr
endfunction
