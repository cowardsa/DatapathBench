module {
  hw.module @MulThree(in %a : i8, in %b : i8, in %c : i8, in %d : i8, out product : i8) {
    %0 = comb.mul %a, %b, %c : i8
    hw.output %0 : i8
  }
}

