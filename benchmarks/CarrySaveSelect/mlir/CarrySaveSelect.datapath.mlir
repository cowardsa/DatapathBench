module {
  hw.module @CarrySaveSelect(in %a : i8, in %b : i8, in %c : i8, in %d : i8, in %e : i8, in %sel : i1, out res : i8) {
    %0:8 = datapath.partial_product %a, %b : (i8, i8) -> (i8, i8, i8, i8, i8, i8, i8, i8)
    %1:2 = datapath.compress %0#0, %0#1, %0#2, %0#3, %0#4, %0#5, %0#6, %0#7 : i8 [8 -> 2]
    %2:8 = datapath.partial_product %c, %d : (i8, i8) -> (i8, i8, i8, i8, i8, i8, i8, i8)
    %3:2 = datapath.compress %2#0, %2#1, %2#2, %2#3, %2#4, %2#5, %2#6, %2#7 : i8 [8 -> 2]
    %4 = comb.mux %sel, %1#0, %3#0 : i8
    %5 = comb.mux %sel, %1#1, %3#1 : i8
    %6:2 = datapath.compress %4, %5, %e : i8 [3 -> 2]
    %7 = comb.add bin %6#0, %6#1 : i8
    hw.output %7 : i8
  }
}

