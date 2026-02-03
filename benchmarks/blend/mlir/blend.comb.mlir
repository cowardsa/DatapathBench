module {
  hw.module @blend(in %A : i16, in %B : i16, in %C : i16, out D : i32) {
    %c0_i15 = hw.constant 0 : i15
    %c0_i16 = hw.constant 0 : i16
    %false = hw.constant false
    %c-65536_i17 = hw.constant -65536 : i17
    %0 = comb.concat %false, %A : i1, i16
    %1 = comb.sub %c-65536_i17, %0 {sv.namehint = "one_minus_A"} : i17
    %2 = comb.concat %c0_i16, %A : i16, i16
    %3 = comb.concat %c0_i16, %B : i16, i16
    %4 = comb.mul %2, %3 : i32
    %5 = comb.concat %c0_i15, %1 : i15, i17
    %6 = comb.concat %c0_i16, %C : i16, i16
    %7 = comb.mul %5, %6 : i32
    %8 = comb.add %4, %7 : i32
    hw.output %8 : i32
  }
}
