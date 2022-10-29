circuit Accu :
  module Accu :
    input clock : Clock
    input reset : UInt<1>
    input io_din : UInt<8>
    input io_setZero : UInt<1>
    output io_dout : UInt<8>

    reg accumulator_reg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), accumulator_reg) @[Accu.scala 15:32]
    node _accumulator_reg_T = add(accumulator_reg, io_din) @[Accu.scala 19:40]
    node _accumulator_reg_T_1 = tail(_accumulator_reg_T, 1) @[Accu.scala 19:40]
    node _GEN_0 = mux(io_setZero, UInt<1>("h0"), _accumulator_reg_T_1) @[Accu.scala 16:20 17:21 19:21]
    node res = accumulator_reg @[Accu.scala 10:17 21:7]
    io_dout <= res @[Accu.scala 24:11]
    accumulator_reg <= mux(reset, UInt<8>("h0"), _GEN_0) @[Accu.scala 15:{32,32}]
