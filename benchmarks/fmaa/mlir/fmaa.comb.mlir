module {
  hw.module @fmaa(in %a : i16, in %b : i16, in %c : i49, in %d : i49, out res : i49) {
    %c0_i33 = hw.constant 0 : i33
    %0 = comb.concat %c0_i33, %a : i33, i16
    %1 = comb.concat %c0_i33, %b : i33, i16
    %2 = comb.mul %0, %1 : i49
    %3 = comb.add %2, %c, %d : i49
    hw.output %3 : i49
  }
}
