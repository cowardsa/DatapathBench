module {
  hw.module @fma(in %a : i8, in %b : i8, in %c : i8, out res : i16) {
    %c0_i8 = hw.constant 0 : i8
    %0 = comb.concat %c0_i8, %a : i8, i8
    %1 = comb.concat %c0_i8, %b : i8, i8
    %2:8 = datapath.partial_product %0, %1 : (i16, i16) -> (i16, i16, i16, i16, i16, i16, i16, i16)
    %3 = comb.concat %c0_i8, %c : i8, i8
    %4:2 = datapath.compress %2#0, %2#1, %2#2, %2#3, %2#4, %2#5, %2#6, %2#7, %3 : i16 [9 -> 2]
    %5 = comb.add bin %4#0, %4#1 : i16
    hw.output %5 : i16
  }
}

