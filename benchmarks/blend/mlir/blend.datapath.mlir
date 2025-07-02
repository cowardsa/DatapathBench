module {
  hw.module @blend(in %A : i6, in %B : i6, in %C : i6, out D : i12) {
    %c0_i5 = hw.constant 0 : i5
    %c0_i6 = hw.constant 0 : i6
    %false = hw.constant false
    %c-64_i7 = hw.constant -64 : i7
    %0 = comb.concat %false, %A : i1, i6
    %1 = comb.sub %c-64_i7, %0 {sv.namehint = "one_minus_A"} : i7
    %2 = comb.concat %c0_i6, %A : i6, i6
    %3 = comb.concat %c0_i6, %B : i6, i6
    %4:6 = datapath.pp %2, %3 : 6 x i12
    %5 = comb.concat %c0_i5, %1 : i5, i7
    %6 = comb.concat %c0_i6, %C : i6, i6
    %7:7 = datapath.pp %5, %6 : 7 x i12
    %8:2 = datapath.compress %4#0, %4#1, %4#2, %4#3, %4#4, %4#5, %7#0, %7#1, %7#2, %7#3, %7#4, %7#5, %7#6 : 13 x i12 -> (i12, i12)
    %9 = comb.add bin %8#0, %8#1 : i12
    hw.output %9 : i12
  }
}

