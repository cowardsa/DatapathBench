module {
  hw.module @FmaShare(in %a : i8, in %b : i8, in %c : i8, in %d : i8, out res_c : i16, out res_d : i16) {
    %c0_i8 = hw.constant 0 : i8
    %0 = comb.concat %c0_i8, %a : i8, i8
    %1 = comb.concat %c0_i8, %b : i8, i8
    %2:8 = datapath.partial_product %0, %1 : (i16, i16) -> (i16, i16, i16, i16, i16, i16, i16, i16)
    %3:2 = datapath.compress %2#0, %2#1, %2#2, %2#3, %2#4, %2#5, %2#6, %2#7 : i16 [8 -> 2]
    %4 = comb.concat %c0_i8, %c : i8, i8
    %5:2 = datapath.compress %3#0, %3#1, %4 : i16 [3 -> 2]
    %6 = comb.add bin %5#0, %5#1 : i16
    %7 = comb.concat %c0_i8, %d : i8, i8
    %8:2 = datapath.compress %3#0, %3#1, %7 : i16 [3 -> 2]
    %9 = comb.add bin %8#0, %8#1 : i16
    hw.output %6, %9 : i16, i16
  }
}

