circuit Mux2 :
  module Mux2 :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<1>
    input io_b : UInt<1>
    input io_sel : UInt<1>
    output io_y : UInt<1>

    node _T = eq(io_sel, UInt<1>("h0")) @[Mux2.scala 17:13]
    node _GEN_0 = mux(_T, io_a, io_b) @[Mux2.scala 17:25 18:9 20:9]
    node res = _GEN_0 @[Mux2.scala 14:17]
    io_y <= res @[Mux2.scala 24:8]
