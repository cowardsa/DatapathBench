module {
  hw.module @fma_share(in %a : i10, in %b : i10, in %c : i10, in %d : i10, out res_c : i20, out res_d : i20) {
    %c0_i10 = hw.constant 0 : i10
    %0 = comb.concat %c0_i10, %a : i10, i10
    %1 = comb.concat %c0_i10, %b : i10, i10
    %2 = comb.mul %0, %1 : i20
    %3 = comb.concat %c0_i10, %c : i10, i10
    %4 = comb.add %2, %3 : i20
    %5 = comb.concat %c0_i10, %d : i10, i10
    %6 = comb.add %2, %5 : i20
    hw.output %4, %6 : i20, i20
  }
}
