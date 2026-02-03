module {
  hw.module @fma(in %a : i8, in %b : i8, in %c : i8, out res : i16) {
    %c0_i8 = hw.constant 0 : i8
    %0 = comb.concat %c0_i8, %a : i8, i8
    %1 = comb.concat %c0_i8, %b : i8, i8
    %2 = comb.mul %0, %1 : i16
    %3 = comb.concat %c0_i8, %c : i8, i8
    %4 = comb.add %2, %3 : i16
    hw.output %4 : i16
  }
}
