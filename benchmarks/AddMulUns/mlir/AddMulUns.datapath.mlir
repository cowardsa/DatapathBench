module {
  hw.module @AddMulUns(in %XS : i8, in %XC : i8, in %Y : i8, out P : i16) {
    %c0_i8 = hw.constant 0 : i8
    %0 = comb.concat %c0_i8, %XS : i8, i8
    %1 = comb.concat %c0_i8, %XC : i8, i8
    %2 = comb.concat %c0_i8, %Y : i8, i8
    %3:9 = datapath.pos_partial_product %0, %1, %2 : (i16, i16, i16) -> (i16, i16, i16, i16, i16, i16, i16, i16, i16)
    %4:2 = datapath.compress %3#0, %3#1, %3#2, %3#3, %3#4, %3#5, %3#6, %3#7, %3#8 : i16 [9 -> 2]
    %5 = comb.add bin %4#0, %4#1 : i16
    hw.output %5 : i16
  }
}

