module {
  hw.module @fma_share(in %a : i16, in %b : i16, in %c : i16, in %d : i16, out res_c : i32, out res_d : i32) {
    %c0_i16 = hw.constant 0 : i16
    %0 = comb.concat %c0_i16, %a : i16, i16
    %1 = comb.concat %c0_i16, %b : i16, i16
    %2 = comb.mul %0, %1 : i32
    %3 = comb.concat %c0_i16, %c : i16, i16
    %4 = comb.add %2, %3 : i32
    %5 = comb.concat %c0_i16, %d : i16, i16
    %6 = comb.add %2, %5 : i32
    hw.output %4, %6 : i32, i32
  }
}
