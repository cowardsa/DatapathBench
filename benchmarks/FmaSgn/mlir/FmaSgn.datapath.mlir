module {
  hw.module @FmaSgn(in %a : i8, in %b : i8, in %c : i8, out res : i16) {
    %c-32639_i16 = hw.constant -32639 : i16
    %c0_i8 = hw.constant 0 : i8
    %true = hw.constant true
    %c-1_i8 = hw.constant -1 : i8
    %false = hw.constant false
    %c0_i14 = hw.constant 0 : i14
    %c0_i2 = hw.constant 0 : i2
    %c0_i7 = hw.constant 0 : i7
    %c-1_i7 = hw.constant -1 : i7
    %c0_i9 = hw.constant 0 : i9
    %0 = comb.extract %a from 7 : (i8) -> i1
    %1 = comb.extract %b from 7 : (i8) -> i1
    %2 = comb.extract %a from 0 : (i8) -> i7
    %3 = comb.extract %b from 0 : (i8) -> i7
    %4 = comb.concat %c0_i9, %2 : i9, i7
    %5 = comb.concat %c0_i9, %3 : i9, i7
    %6:7 = datapath.partial_product %4, %5 : (i16, i16) -> (i16, i16, i16, i16, i16, i16, i16)
    %7 = comb.replicate %0 : (i1) -> i7
    %8 = comb.and %7, %3 : i7
    %9 = comb.xor bin %8, %c-1_i7 : i7
    %10 = comb.concat %c0_i2, %9, %c0_i7 : i2, i7, i7
    %11 = comb.replicate %1 : (i1) -> i7
    %12 = comb.and %11, %2 : i7
    %13 = comb.xor bin %12, %c-1_i7 : i7
    %14 = comb.concat %c0_i2, %13, %c0_i7 : i2, i7, i7
    %15 = comb.and %0, %1 : i1
    %16 = comb.concat %false, %15, %c0_i14 : i1, i1, i14
    %17 = comb.xor bin %c, %c-1_i8 : i8
    %18 = comb.extract %17 from 0 : (i8) -> i7
    %19 = comb.extract %17 from 7 : (i8) -> i1
    %20 = comb.xor bin %19, %true : i1
    %21 = comb.concat %c0_i8, %20, %18 : i8, i1, i7
    %22:2 = datapath.compress %6#0, %6#1, %6#2, %6#3, %6#4, %6#5, %6#6, %10, %14, %16, %21, %c-32639_i16 : i16 [12 -> 2]
    %23 = comb.add bin %22#0, %22#1 : i16
    hw.output %23 : i16
  }
}

