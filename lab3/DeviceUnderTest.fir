circuit DeviceUnderTest :
  module DeviceUnderTest :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip a : UInt<2>, flip b : UInt<2>, out : UInt<2>}

    node _io_out_T = and(io.a, io.b) @[Mux2.scala 27:18]
    io.out <= _io_out_T @[Mux2.scala 27:10]

