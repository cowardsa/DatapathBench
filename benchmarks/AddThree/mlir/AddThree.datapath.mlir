module {
  hw.module @AddThree(in %a : i8, in %b : i8, in %c : i8, out sum : i9) {
    %false = hw.constant false
    %0 = comb.concat %false, %a : i1, i8
    %1 = comb.concat %false, %b : i1, i8
    %2 = comb.concat %false, %c : i1, i8
    %3:2 = datapath.compress %0, %1, %2 : i9 [3 -> 2]
    %4 = comb.add bin %3#0, %3#1 : i9
    hw.output %4 : i9
  }
}

