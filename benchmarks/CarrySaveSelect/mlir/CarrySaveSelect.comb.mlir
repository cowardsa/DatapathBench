module {
  hw.module @CarrySaveSelect(in %a : i8, in %b : i8, in %c : i8, in %d : i8, in %e : i8, in %sel : i1, out res : i8) {
    %0 = comb.mul %a, %b : i8
    %1 = comb.mul %c, %d : i8
    %2 = comb.mux %sel, %0, %1 : i8
    %3 = comb.add %2, %e : i8
    hw.output %3 : i8
  }
}
