module {
  hw.module @add_three(in %a : i16, in %b : i16, in %c : i16, out sum : i17) {
    %false = hw.constant false
    %0 = comb.concat %false, %a : i1, i16
    %1 = comb.concat %false, %b : i1, i16
    %2 = comb.concat %false, %c : i1, i16
    %3 = comb.add %0, %1, %2 : i17
    hw.output %3 : i17
  }
}
