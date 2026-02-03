module {
  hw.module @MulAddUns(in %X : i8, in %Y : i8, in %A : i16, out P : i16) {
    %c0_i8 = hw.constant 0 : i8
    %0 = comb.concat %c0_i8, %X : i8, i8
    %1 = comb.concat %c0_i8, %Y : i8, i8
    %2 = comb.mul %0, %1 : i16
    %3 = comb.add %2, %A : i16
    hw.output %3 : i16
  }
}
