module {
  hw.module @FmaaSgn(in %a : i8, in %b : i8, in %c : i25, in %d : i25, out res : i25) {
    %c-32510_i25 = hw.constant -32510 : i25
    %c0_i10 = hw.constant 0 : i10
    %c0_i14 = hw.constant 0 : i14
    %c0_i11 = hw.constant 0 : i11
    %c0_i7 = hw.constant 0 : i7
    %c-1_i7 = hw.constant -1 : i7
    %c0_i18 = hw.constant 0 : i18
    %c-1_i25 = hw.constant -1 : i25
    %0 = comb.extract %a from 7 : (i8) -> i1
    %1 = comb.extract %b from 7 : (i8) -> i1
    %2 = comb.extract %a from 0 : (i8) -> i7
    %3 = comb.extract %b from 0 : (i8) -> i7
    %4 = comb.concat %c0_i18, %2 : i18, i7
    %5 = comb.concat %c0_i18, %3 : i18, i7
    %6:7 = datapath.partial_product %4, %5 : (i25, i25) -> (i25, i25, i25, i25, i25, i25, i25)
    %7 = comb.replicate %0 : (i1) -> i7
    %8 = comb.and %7, %3 : i7
    %9 = comb.xor bin %8, %c-1_i7 : i7
    %10 = comb.concat %c0_i11, %9, %c0_i7 : i11, i7, i7
    %11 = comb.replicate %1 : (i1) -> i7
    %12 = comb.and %11, %2 : i7
    %13 = comb.xor bin %12, %c-1_i7 : i7
    %14 = comb.concat %c0_i11, %13, %c0_i7 : i11, i7, i7
    %15 = comb.and %0, %1 : i1
    %16 = comb.concat %c0_i10, %15, %c0_i14 : i10, i1, i14
    %17 = comb.xor %c, %c-1_i25 : i25
    %18 = comb.xor %d, %c-1_i25 : i25
    %19:2 = datapath.compress %6#0, %6#1, %6#2, %6#3, %6#4, %6#5, %6#6, %10, %14, %16, %17, %18, %c-32510_i25 : i25 [13 -> 2]
    %20 = comb.add bin %19#0, %19#1 : i25
    hw.output %20 : i25
  }
}

