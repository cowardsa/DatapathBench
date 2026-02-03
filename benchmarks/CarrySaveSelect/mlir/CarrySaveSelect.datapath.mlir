module {
  hw.module @CarrySaveSelect(in %a : i8, in %b : i8, in %c : i8, in %d : i8, in %e : i8, in %sel : i1, out res : i8) {
    %0:8 = datapath.partial_product %a, %b : (i8, i8) -> (i8, i8, i8, i8, i8, i8, i8, i8)
    %1:2 = datapath.compress %0#0, %0#1, %0#2, %0#3, %0#4, %0#5, %0#6, %0#7 : i8 [8 -> 2]
    %2 = comb.add bin %1#0, %1#1 : i8
    %3:8 = datapath.partial_product %c, %d : (i8, i8) -> (i8, i8, i8, i8, i8, i8, i8, i8)
    %4:2 = datapath.compress %3#0, %3#1, %3#2, %3#3, %3#4, %3#5, %3#6, %3#7 : i8 [8 -> 2]
    %5 = comb.add bin %4#0, %4#1 : i8
    %6 = comb.mux %sel, %2, %5 : i8
    %7 = comb.add %6, %e : i8
    hw.output %7 : i8
  }
}

