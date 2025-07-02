module {
  hw.module @fmaa(in %a : i20, in %b : i20, in %c : i61, in %d : i61, out res : i61) {
    %c0_i41 = hw.constant 0 : i41
    %0 = comb.concat %c0_i41, %a : i41, i20
    %1 = comb.concat %c0_i41, %b : i41, i20
    %2:20 = datapath.pp %0, %1 : 20 x i61
    %3:2 = datapath.compress %2#0, %2#1, %2#2, %2#3, %2#4, %2#5, %2#6, %2#7, %2#8, %2#9, %2#10, %2#11, %2#12, %2#13, %2#14, %2#15, %2#16, %2#17, %2#18, %2#19, %c, %d : 22 x i61 -> (i61, i61)
    %4 = comb.add bin %3#0, %3#1 : i61
    hw.output %4 : i61
  }
}

