module {
  hw.module @MulAddUns(in %X : i8, in %Y : i8, in %A : i16, out P : i16) {
    %c0_i8 = hw.constant 0 : i8
    %0 = comb.concat %c0_i8, %X : i8, i8
    %1 = comb.concat %c0_i8, %Y : i8, i8
    %2:8 = datapath.partial_product %0, %1 : (i16, i16) -> (i16, i16, i16, i16, i16, i16, i16, i16)
    %3:2 = datapath.compress %2#0, %2#1, %2#2, %2#3, %2#4, %2#5, %2#6, %2#7, %A : i16 [9 -> 2]
    %4 = comb.add bin %3#0, %3#1 : i16
    hw.output %4 : i16
  }
}

