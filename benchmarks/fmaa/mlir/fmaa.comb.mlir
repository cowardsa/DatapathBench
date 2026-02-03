module {
  hw.module @fmaa(in %a : i8, in %b : i8, in %c : i25, in %d : i25, out res : i25) {
    %c0_i17 = hw.constant 0 : i17
    %0 = comb.concat %c0_i17, %a : i17, i8
    %1 = comb.concat %c0_i17, %b : i17, i8
    %2 = comb.mul %0, %1 : i25
    %3 = comb.add %2, %c, %d : i25
    hw.output %3 : i25
  }
}
