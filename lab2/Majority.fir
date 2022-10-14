circuit Majority :
  module Majority :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip c : UInt<1>, out : UInt<1>}

    node _res_T = and(io.a, io.b) @[Majority.scala 23:16]
    node _res_T_1 = and(io.a, io.c) @[Majority.scala 23:26]
    node _res_T_2 = or(_res_T, _res_T_1) @[Majority.scala 23:21]
    node _res_T_3 = and(io.b, io.c) @[Majority.scala 23:36]
    node res = or(_res_T_2, _res_T_3) @[Majority.scala 23:31]
    io.out <= res @[Majority.scala 29:10]

