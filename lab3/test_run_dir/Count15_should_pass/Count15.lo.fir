circuit Count15 :
  module Count15 :
    input clock : Clock
    input reset : UInt<1>
    output io_dout : UInt<8>

    reg counter_reg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), counter_reg) @[Count15.scala 13:29]
    node _counter_reg_T = add(counter_reg, UInt<4>("h1")) @[Count15.scala 14:30]
    node _counter_reg_T_1 = tail(_counter_reg_T, 1) @[Count15.scala 14:30]
    node res = counter_reg @[Count15.scala 8:17 15:8]
    io_dout <= pad(res, 8) @[Count15.scala 18:11]
    counter_reg <= mux(reset, UInt<4>("h0"), _counter_reg_T_1) @[Count15.scala 13:{29,29} 14:15]
