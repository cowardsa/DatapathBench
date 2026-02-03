module {
  hw.module @CarrySaveCompare(in %a : i8, in %b : i8, in %c : i8, in %d : i8, out res : i1) {
    %c0_i7 = hw.constant 0 : i7
    %c0_i8 = hw.constant 0 : i8
    %false = hw.constant false
    %0 = comb.concat %false, %a : i1, i8
    %1 = comb.concat %false, %b : i1, i8
    %2 = comb.add %0, %1 {sv.namehint = "t1"} : i9
    %3 = comb.concat %c0_i8, %c : i8, i8
    %4 = comb.concat %c0_i8, %d : i8, i8
    %5:8 = datapath.partial_product %3, %4 : (i16, i16) -> (i16, i16, i16, i16, i16, i16, i16, i16)
    %6:2 = datapath.compress %5#0, %5#1, %5#2, %5#3, %5#4, %5#5, %5#6, %5#7 : i16 [8 -> 2]
    %7 = comb.add bin %6#0, %6#1 : i16
    %8 = comb.concat %c0_i7, %2 : i7, i9
    %9 = comb.icmp ugt %8, %7 : i16
    hw.output %9 : i1
  }
}

