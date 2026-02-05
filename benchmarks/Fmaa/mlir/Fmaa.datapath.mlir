module {
  hw.module @Fmaa(in %a : i8, in %b : i8, in %c : i25, in %d : i25, out res : i25) {
    %c0_i17 = hw.constant 0 : i17
    %0 = comb.concat %c0_i17, %a : i17, i8
    %1 = comb.concat %c0_i17, %b : i17, i8
    %2:8 = datapath.partial_product %0, %1 : (i25, i25) -> (i25, i25, i25, i25, i25, i25, i25, i25)
    %3:2 = datapath.compress %2#0, %2#1, %2#2, %2#3, %2#4, %2#5, %2#6, %2#7, %c, %d : i25 [10 -> 2]
    %4 = comb.add bin %3#0, %3#1 : i25
    hw.output %4 : i25
  }
}

