module {
  hw.module @fma_share(in %a : i10, in %b : i10, in %c : i10, in %d : i10, out res_c : i20, out res_d : i20) {
    %c0_i10 = hw.constant 0 : i10
    %0 = comb.concat %c0_i10, %a : i10, i10
    %1 = comb.concat %c0_i10, %b : i10, i10
    %2:10 = datapath.pp %0, %1 : 10 x i20
    %3:2 = datapath.compress %2#0, %2#1, %2#2, %2#3, %2#4, %2#5, %2#6, %2#7, %2#8, %2#9 : 10 x i20 -> (i20, i20)
    %4 = comb.concat %c0_i10, %c : i10, i10
    %5:2 = datapath.compress %3#0, %3#1, %4 : 3 x i20 -> (i20, i20)
    %6 = comb.add bin %5#0, %5#1 : i20
    %7 = comb.concat %c0_i10, %d : i10, i10
    %8:2 = datapath.compress %3#0, %3#1, %7 : 3 x i20 -> (i20, i20)
    %9 = comb.add bin %8#0, %8#1 : i20
    hw.output %6, %9 : i20, i20
  }
}

