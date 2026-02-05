module {
  hw.module @FmaSgn(in %a : i8, in %b : i8, in %c : i8, out res : i16) {
    %0 = comb.extract %a from 7 : (i8) -> i1
    %1 = comb.replicate %0 : (i1) -> i8
    %2 = comb.concat %1, %a : i8, i8
    %3 = comb.extract %b from 7 : (i8) -> i1
    %4 = comb.replicate %3 : (i1) -> i8
    %5 = comb.concat %4, %b : i8, i8
    %6 = comb.mul %2, %5 : i16
    %7 = comb.extract %c from 7 : (i8) -> i1
    %8 = comb.replicate %7 : (i1) -> i8
    %9 = comb.concat %8, %c : i8, i8
    %10 = comb.sub %6, %9 : i16
    hw.output %10 : i16
  }
}
