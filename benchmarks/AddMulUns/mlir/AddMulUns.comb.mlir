module {
  hw.module @AddMulUns(in %XS : i8, in %XC : i8, in %Y : i8, out P : i16) {
    %c0_i8 = hw.constant 0 : i8
    %0 = comb.concat %c0_i8, %XS : i8, i8
    %1 = comb.concat %c0_i8, %XC : i8, i8
    %2 = comb.add %0, %1 : i16
    %3 = comb.concat %c0_i8, %Y : i8, i8
    %4 = comb.mul %2, %3 : i16
    hw.output %4 : i16
  }
}
