circuit DeviceUnderTest :
  module DeviceUnderTest :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<2>
    input io_b : UInt<2>
    output io_out : UInt<2>

    node _io_out_T = and(io_a, io_b) @[Mux2.scala 27:18]
    io_out <= _io_out_T @[Mux2.scala 27:10]
