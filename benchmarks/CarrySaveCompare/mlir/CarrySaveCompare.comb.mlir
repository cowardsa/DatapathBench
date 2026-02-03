module {
  hw.module @CarrySaveCompare(in %a : i16, in %b : i16, in %c : i16, in %d : i16, out res : i1) {
    %c0_i15 = hw.constant 0 : i15
    %c0_i16 = hw.constant 0 : i16
    %false = hw.constant false
    %0 = comb.concat %false, %a : i1, i16
    %1 = comb.concat %false, %b : i1, i16
    %2 = comb.add %0, %1 {sv.namehint = "t1"} : i17
    %3 = comb.concat %c0_i16, %c : i16, i16
    %4 = comb.concat %c0_i16, %d : i16, i16
    %5 = comb.mul %3, %4 {sv.namehint = "t2"} : i32
    %6 = comb.concat %c0_i15, %2 : i15, i17
    %7 = comb.icmp ugt %6, %5 : i32
    hw.output %7 : i1
  }
}
