module {
  hw.module @fma(in %a : i4, in %b : i4, in %c : i4, out res : i8) {
    %c0_i4 = hw.constant 0 : i4
    %0 = comb.concat %c0_i4, %a : i4, i4
    %1 = comb.concat %c0_i4, %b : i4, i4
    %2 = comb.mul %0, %1 : i8
    %3 = comb.concat %c0_i4, %c : i4, i4
    %4 = comb.add %2, %3 : i8
    hw.output %4 : i8
  }
}
