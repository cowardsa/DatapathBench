module {
  hw.module @fmaa(in %a : i20, in %b : i20, in %c : i61, in %d : i61, out res : i61) {
    %c0_i41 = hw.constant 0 : i41
    %0 = comb.concat %c0_i41, %a : i41, i20
    %1 = comb.concat %c0_i41, %b : i41, i20
    %2 = comb.mul %0, %1 : i61
    %3 = comb.add %2, %c, %d : i61
    hw.output %3 : i61
  }
}
