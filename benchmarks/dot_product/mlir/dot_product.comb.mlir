module {
  hw.module @dot_product(in %a : i16, in %b : i16, in %c : i16, in %d : i16, out res : i32) {
    %c0_i16 = hw.constant 0 : i16
    %0 = comb.concat %c0_i16, %a : i16, i16
    %1 = comb.concat %c0_i16, %b : i16, i16
    %2 = comb.mul %0, %1 : i32
    %3 = comb.concat %c0_i16, %c : i16, i16
    %4 = comb.concat %c0_i16, %d : i16, i16
    %5 = comb.mul %3, %4 : i32
    %6 = comb.add %2, %5 : i32
    hw.output %6 : i32
  }
}
