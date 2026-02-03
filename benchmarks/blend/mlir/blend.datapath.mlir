module {
  hw.module @blend(in %A : i8, in %B : i8, in %C : i8, out D : i16) {
    %c-255_i9 = hw.constant -255 : i9
    %c0_i7 = hw.constant 0 : i7
    %c0_i8 = hw.constant 0 : i8
    %true = hw.constant true
    %c-1_i8 = hw.constant -1 : i8
    %0 = comb.xor %A, %c-1_i8 : i8
    %1 = comb.concat %true, %0 : i1, i8
    %2 = comb.add bin %1, %c-255_i9 : i9
    %3 = comb.concat %c0_i8, %A : i8, i8
    %4 = comb.concat %c0_i8, %B : i8, i8
    %5:8 = datapath.partial_product %3, %4 : (i16, i16) -> (i16, i16, i16, i16, i16, i16, i16, i16)
    %6 = comb.concat %c0_i7, %2 : i7, i9
    %7 = comb.concat %c0_i8, %C : i8, i8
    %8:9 = datapath.partial_product %6, %7 : (i16, i16) -> (i16, i16, i16, i16, i16, i16, i16, i16, i16)
    %9:2 = datapath.compress %5#0, %5#1, %5#2, %5#3, %5#4, %5#5, %5#6, %5#7, %8#0, %8#1, %8#2, %8#3, %8#4, %8#5, %8#6, %8#7, %8#8 : i16 [17 -> 2]
    %10 = comb.add bin %9#0, %9#1 : i16
    hw.output %10 : i16
  }
}

