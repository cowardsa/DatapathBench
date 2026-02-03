module {
  hw.module @MulThree(in %a : i16, in %b : i16, in %c : i16, in %d : i16, out product : i16) {
    %0 = comb.mul %a, %b, %c : i16
    hw.output %0 : i16
  }
}
