module {
  hw.module @fma(in %a : i4, in %b : i4, in %c : i4, out res : i4) {
      %0:4 = datapath.pp %a, %b : 4 x i4
      %1:2 = datapath.compress %0#0, %0#1, %0#2, %0#3, %c : 5 x i4 -> (i4, i4) 
      %2 = comb.add %1#0, %1#1 : i4
    hw.output %2 : i4
  }
}
