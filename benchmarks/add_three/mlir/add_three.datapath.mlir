module {
  hw.module @add_three(in %a : i4, in %b : i4, in %c : i4, out sum : i5) {
    %false = hw.constant false
    %0 = comb.concat %false, %a : i1, i4
    %1 = comb.concat %false, %b : i1, i4
    %2 = comb.concat %false, %c : i1, i4
    %3:2 = datapath.compress %0, %1, %2 : 3 x i5 -> (i5, i5)
    %4 = comb.add bin %3#0, %3#1 : i5
    hw.output %4 : i5
  }
}

