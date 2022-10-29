circuit Mux4 :
  module Mux2 :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<1>
    input io_b : UInt<1>
    input io_sel : UInt<1>
    output io_y : UInt<1>

    node _T = eq(io_sel, UInt<1>("h1")) @[Mux2.scala 17:16]
    node _GEN_0 = mux(_T, io_b, io_a) @[Mux2.scala 17:25 18:10 16:8]
    io_y <= _GEN_0

  module Mux4 :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<1>
    input io_b : UInt<1>
    input io_c : UInt<1>
    input io_d : UInt<1>
    input io_sel : UInt<2>
    output io_y : UInt<1>

    inst mux2_a of Mux2 @[Mux4.scala 18:22]
    inst mux2_b of Mux2 @[Mux4.scala 19:22]
    inst mux2_c of Mux2 @[Mux4.scala 20:22]
    node _mux2_a_io_sel_T = bits(io_sel, 0, 0) @[Mux4.scala 24:26]
    node _mux2_b_io_sel_T = bits(io_sel, 0, 0) @[Mux4.scala 28:26]
    node _mux2_c_io_sel_T = bits(io_sel, 1, 1) @[Mux4.scala 32:26]
    io_y <= mux2_c.io_y @[Mux4.scala 34:8]
    mux2_a.clock <= clock
    mux2_a.reset <= reset
    mux2_a.io_a <= io_a @[Mux4.scala 22:15]
    mux2_a.io_b <= io_b @[Mux4.scala 23:15]
    mux2_a.io_sel <= _mux2_a_io_sel_T @[Mux4.scala 24:17]
    mux2_b.clock <= clock
    mux2_b.reset <= reset
    mux2_b.io_a <= io_c @[Mux4.scala 26:15]
    mux2_b.io_b <= io_d @[Mux4.scala 27:15]
    mux2_b.io_sel <= _mux2_b_io_sel_T @[Mux4.scala 28:17]
    mux2_c.clock <= clock
    mux2_c.reset <= reset
    mux2_c.io_a <= mux2_a.io_y @[Mux4.scala 30:15]
    mux2_c.io_b <= mux2_b.io_y @[Mux4.scala 31:15]
    mux2_c.io_sel <= _mux2_c_io_sel_T @[Mux4.scala 32:17]
