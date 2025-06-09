function gaussian_elimination()
   arr = [4, 2, 5; 1, .5, 2; 1, .5, -1.4];
   is_singular(arr)
   find_ref(arr)
   find_rref(arr)
endfunction

function arr = find_rref(arr)
  [m, n] = size(arr);
   curr_row = 1;
   curr_col = 1;
   while curr_row <= m && curr_col <= n
     if arr(curr_row, curr_col) == 0

       found_replacement = false;
       for i = (curr_row + 1):m
         if arr(i, curr_col) != 0
           arr = swap_rows(arr, curr_row, i);
           found_replacement = true;
           break;
         endif
       endfor
       if found_replacement == false
         curr_col = curr_col + 1;
         continue;
       endif
     endif

     arr = scale_row(arr, curr_row, 1 / arr(curr_row, curr_col));

     for i = 1:m
       if i != curr_row
         arr = add_row(arr, i, curr_row, -arr(i, curr_col) / arr(curr_row, curr_col));
       endif
     endfor


     curr_col = curr_col + 1;
     curr_row = curr_row + 1;
   endwhile
endfunction

function arr = find_ref(arr)
  [m, n] = size(arr);
   curr_row = 1;
   curr_col = 1;
   while curr_row <= m && curr_col <= n
     if arr(curr_row, curr_col) == 0

       found_replacement = false;
       for i = (curr_row + 1):m
         if arr(i, curr_col) != 0
           arr = swap_rows(arr, curr_row, i);
           found_replacement = true;
           break;
         endif
       endfor
       if found_replacement == false
         curr_col = curr_col + 1;
         continue;
       endif
     endif

     for i = curr_row+1:m
       if i != curr_row
         arr = add_row(arr, i, curr_row, -arr(i, curr_col) / arr(curr_row, curr_col));
       endif
     endfor


     curr_col = curr_col + 1;
     curr_row = curr_row + 1;
   endwhile
endfunction

function ret = is_singular(arr)
  [m, n] = size(arr);
  if m != n
    ret = true;
    return;
  endif

  rref_arr = find_rref(arr);
  for i = 1:n
    if (rref_arr(i, i) != 1)
      ret = true;
      return;
    endif
  endfor
  ret = false;
endfunction

function arr = scale_row(arr, row, x)
  n = size(arr)(2);
  for i = 1:n
    arr(row, i) = arr(row, i) * x;
  endfor
endfunction

function arr = swap_rows(arr, row1, row2)
  for i = 1:size(arr)(2)
    temp = arr(row1, i);
    arr(row1, i) = arr(row2, i);
    arr(row2, i) = temp;
  endfor
endfunction

function arr = add_row(arr, modified_row, added_row, x)
  n = size(arr)(2);
  for i = 1:n
    arr(modified_row, i) = arr(modified_row, i) + x * arr(added_row, i);
  endfor
endfunction

