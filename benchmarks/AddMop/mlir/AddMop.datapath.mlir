module {
  hw.module @AddMop(in %A : i32, out S : i8) {
    %0 = comb.extract %A from 0 : (i32) -> i8
    %1 = comb.extract %A from 8 : (i32) -> i8
    %2 = comb.extract %A from 16 : (i32) -> i8
    %3 = comb.extract %A from 24 : (i32) -> i8
    %4:2 = datapath.compress %0, %1, %2, %3 : i8 [4 -> 2]
    %5 = comb.add bin %4#0, %4#1 : i8
    hw.output %5 : i8
  }
}

