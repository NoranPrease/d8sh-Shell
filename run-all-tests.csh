#!/bin/csh

test -e Makefile || echo "No Makefile present." && exit
test -x ./d8sh || echo "No d8sh present. run make" && exit
test -e public.input || ln -s testing/public.input
test -e public1.input || ln -s testing/public1.input
foreach f ( testing/public*.in )
  echo -n $f " " 
  ./d8sh < $f | diff - `echo $f | sed 's/.in$/.output/'` && echo passed
end
test -L public.input && rm public.input
test -L public1.input && rm public1.input
