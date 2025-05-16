module {
  hw.module @fma(in %a : i4, in %b : i4, in %c : i4, out res : i8) {
    %c0_i5 = hw.constant 0 : i5
    %c0_i6 = hw.constant 0 : i6
    %c0_i7 = hw.constant 0 : i7
    %c0_i3 = hw.constant 0 : i3
    %c0_i2 = hw.constant 0 : i2
    %false = hw.constant false
    %c0_i8 = hw.constant 0 : i8
    %c0_i4 = hw.constant 0 : i4
    %0 = comb.concat %c0_i4, %b : i4, i4
    %1 = comb.extract %a from 0 : (i4) -> i1
    %2 = comb.extract %a from 1 : (i4) -> i1
    %3 = comb.extract %a from 2 : (i4) -> i1
    %4 = comb.extract %a from 3 : (i4) -> i1
    %5 = comb.mux %1, %0, %c0_i8 : i8
    %6 = comb.concat %c0_i3, %b : i3, i4
    %7 = comb.mux %2, %6, %c0_i7 : i7
    %8 = comb.concat %7, %false : i7, i1
    %9 = comb.concat %c0_i2, %b : i2, i4
    %10 = comb.mux %3, %9, %c0_i6 : i6
    %11 = comb.concat %10, %c0_i2 : i6, i2
    %12 = comb.concat %false, %b : i1, i4
    %13 = comb.mux %4, %12, %c0_i5 : i5
    %14 = comb.concat %13, %c0_i3 : i5, i3
    %15 = comb.concat %c0_i4, %c : i4, i4
    %16:2 = datapath.compress %5, %8, %11, %14, %15 : 5 x i8 -> (i8, i8)
    %17 = comb.add bin %16#0, %16#1 : i8
    hw.output %17 : i8
  }
}

