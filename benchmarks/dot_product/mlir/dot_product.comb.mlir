module {
  hw.module @dot_product(in %a : i4, in %b : i4, in %c : i4, in %d : i4, out res : i8) {
    %c0_i4 = hw.constant 0 : i4
    %0 = comb.concat %c0_i4, %a : i4, i4
    %1 = comb.concat %c0_i4, %b : i4, i4
    %2 = comb.mul %0, %1 : i8
    %3 = comb.concat %c0_i4, %c : i4, i4
    %4 = comb.concat %c0_i4, %d : i4, i4
    %5 = comb.mul %3, %4 : i8
    %6 = comb.add %2, %5 : i8
    hw.output %6 : i8
  }
}
