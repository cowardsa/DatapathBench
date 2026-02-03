module {
  hw.module @FmaSgn(in %a : i8, in %b : i8, in %c : i8, out res : i16) {
    %c-255_i16 = hw.constant -255 : i16
    %c-1_i8 = hw.constant -1 : i8
    %c0_i8 = hw.constant 0 : i8
    %0 = comb.concat %c0_i8, %a : i8, i8
    %1 = comb.concat %c0_i8, %b : i8, i8
    %2:8 = datapath.partial_product %0, %1 : (i16, i16) -> (i16, i16, i16, i16, i16, i16, i16, i16)
    %3 = comb.xor %c, %c-1_i8 : i8
    %4 = comb.concat %c0_i8, %3 : i8, i8
    %5:2 = datapath.compress %2#0, %2#1, %2#2, %2#3, %2#4, %2#5, %2#6, %2#7, %4, %c-255_i16 : i16 [10 -> 2]
    %6 = comb.add bin %5#0, %5#1 : i16
    hw.output %6 : i16
  }
}

