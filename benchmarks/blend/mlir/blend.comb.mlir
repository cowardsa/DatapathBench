module {
  hw.module @blend(in %A : i8, in %B : i8, in %C : i8, out D : i16) {
    %c0_i7 = hw.constant 0 : i7
    %c0_i8 = hw.constant 0 : i8
    %false = hw.constant false
    %c-256_i9 = hw.constant -256 : i9
    %0 = comb.concat %false, %A : i1, i8
    %1 = comb.sub %c-256_i9, %0 {sv.namehint = "one_minus_A"} : i9
    %2 = comb.concat %c0_i8, %A : i8, i8
    %3 = comb.concat %c0_i8, %B : i8, i8
    %4 = comb.mul %2, %3 : i16
    %5 = comb.concat %c0_i7, %1 : i7, i9
    %6 = comb.concat %c0_i8, %C : i8, i8
    %7 = comb.mul %5, %6 : i16
    %8 = comb.add %4, %7 : i16
    hw.output %8 : i16
  }
}
