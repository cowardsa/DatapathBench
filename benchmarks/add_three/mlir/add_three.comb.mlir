module {
  hw.module @add_three(in %a : i4, in %b : i4, in %c : i4, out sum : i5) {
    %false = hw.constant false
    %0 = comb.concat %false, %a : i1, i4
    %1 = comb.concat %false, %b : i1, i4
    %2 = comb.concat %false, %c : i1, i4
    %3 = comb.add %0, %1, %2 : i5
    hw.output %3 : i5
  }
}
