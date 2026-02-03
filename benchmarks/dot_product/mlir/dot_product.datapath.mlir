module {
  hw.module @dot_product(in %a : i8, in %b : i8, in %c : i8, in %d : i8, out res : i16) {
    %c0_i8 = hw.constant 0 : i8
    %0 = comb.concat %c0_i8, %a : i8, i8
    %1 = comb.concat %c0_i8, %b : i8, i8
    %2:8 = datapath.partial_product %0, %1 : (i16, i16) -> (i16, i16, i16, i16, i16, i16, i16, i16)
    %3 = comb.concat %c0_i8, %c : i8, i8
    %4 = comb.concat %c0_i8, %d : i8, i8
    %5:8 = datapath.partial_product %3, %4 : (i16, i16) -> (i16, i16, i16, i16, i16, i16, i16, i16)
    %6:2 = datapath.compress %2#0, %2#1, %2#2, %2#3, %2#4, %2#5, %2#6, %2#7, %5#0, %5#1, %5#2, %5#3, %5#4, %5#5, %5#6, %5#7 : i16 [16 -> 2]
    %7 = comb.add bin %6#0, %6#1 : i16
    hw.output %7 : i16
  }
}

