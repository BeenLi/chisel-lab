circuit Count6 :
  module Count6 :
    input clock : Clock
    input reset : UInt<1>
    output io_dout : UInt<8>

    reg counter_reg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), counter_reg) @[Count6.scala 14:28]
    node _counter_reg_T = add(counter_reg, UInt<4>("h1")) @[Count6.scala 15:30]
    node _counter_reg_T_1 = tail(_counter_reg_T, 1) @[Count6.scala 15:30]
    node _T = eq(counter_reg, UInt<3>("h6")) @[Count6.scala 16:21]
    node _GEN_0 = mux(_T, UInt<1>("h0"), _counter_reg_T_1) @[Count6.scala 15:15 16:29 17:17]
    node res = counter_reg @[Count6.scala 8:17 19:7]
    io_dout <= pad(res, 8) @[Count6.scala 22:11]
    counter_reg <= mux(reset, UInt<4>("h0"), _GEN_0) @[Count6.scala 14:{28,28}]
