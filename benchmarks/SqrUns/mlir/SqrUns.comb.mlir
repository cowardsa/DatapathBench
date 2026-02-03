module {
  hw.module @SqrUns(in %X : i8, out P : i16) {
    %c0_i8 = hw.constant 0 : i8
    %0 = comb.concat %c0_i8, %X : i8, i8
    %1 = comb.mul %0, %0 : i16
    hw.output %1 : i16
  }
}
