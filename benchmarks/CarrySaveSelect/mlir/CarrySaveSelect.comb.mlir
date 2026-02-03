module {
  hw.module @CarrySaveSelect(in %a : i16, in %b : i16, in %c : i16, in %d : i16, in %e : i16, in %sel : i1, out res : i16) {
    %0 = comb.mul %a, %b : i16
    %1 = comb.mul %c, %d : i16
    %2 = comb.mux %sel, %0, %1 : i16
    %3 = comb.add %2, %e : i16
    hw.output %3 : i16
  }
}
