module {
  hw.module @fma(in %a : i20, in %b : i20, in %c : i20, out res : i40) {
    %c0_i20 = hw.constant 0 : i20
    %0 = comb.concat %c0_i20, %a : i20, i20
    %1 = comb.concat %c0_i20, %b : i20, i20
    %2:20 = datapath.pp %0, %1 : 20 x i40
    %3 = comb.concat %c0_i20, %c : i20, i20
    %4:2 = datapath.compress %2#0, %2#1, %2#2, %2#3, %2#4, %2#5, %2#6, %2#7, %2#8, %2#9, %2#10, %2#11, %2#12, %2#13, %2#14, %2#15, %2#16, %2#17, %2#18, %2#19, %3 : 21 x i40 -> (i40, i40)
    %5 = comb.add bin %4#0, %4#1 : i40
    hw.output %5 : i40
  }
}

