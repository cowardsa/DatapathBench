module {
  hw.module @SqrUns(in %X : i8, out P : i16) {
    %c0_i8 = hw.constant 0 : i8
    %0 = comb.concat %c0_i8, %X : i8, i8
    %1:8 = datapath.partial_product %0, %0 : (i16, i16) -> (i16, i16, i16, i16, i16, i16, i16, i16)
    %2:2 = datapath.compress %1#0, %1#1, %1#2, %1#3, %1#4, %1#5, %1#6, %1#7 : i16 [8 -> 2]
    %3 = comb.add bin %2#0, %2#1 : i16
    hw.output %3 : i16
  }
}

