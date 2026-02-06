module {
  hw.module @FmaaSgn(in %a : i8, in %b : i8, in %c : i25, in %d : i25, out res : i25) {
    %0 = comb.extract %a from 7 : (i8) -> i1
    %1 = comb.replicate %0 : (i1) -> i17
    %2 = comb.concat %1, %a : i17, i8
    %3 = comb.extract %b from 7 : (i8) -> i1
    %4 = comb.replicate %3 : (i1) -> i17
    %5 = comb.concat %4, %b : i17, i8
    %6 = comb.mul %2, %5 : i25
    %7 = comb.sub %6, %c : i25
    %8 = comb.sub %7, %d : i25
    hw.output %8 : i25
  }
}
