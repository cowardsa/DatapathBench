module {
  hw.module @blend(in %A : i6, in %B : i6, in %C : i6, out D : i12) {
    %c0_i5 = hw.constant 0 : i5
    %c0_i6 = hw.constant 0 : i6
    %false = hw.constant false
    %c-64_i7 = hw.constant -64 : i7
    %0 = comb.concat %false, %A : i1, i6
    %1 = comb.sub %c-64_i7, %0 {sv.namehint = "one_minus_A"} : i7
    %2 = comb.concat %c0_i6, %A : i6, i6
    %3 = comb.concat %c0_i6, %B : i6, i6
    %4 = comb.mul %2, %3 : i12
    %5 = comb.concat %c0_i5, %1 : i5, i7
    %6 = comb.concat %c0_i6, %C : i6, i6
    %7 = comb.mul %5, %6 : i12
    %8 = comb.add %4, %7 : i12
    hw.output %8 : i12
  }
}
