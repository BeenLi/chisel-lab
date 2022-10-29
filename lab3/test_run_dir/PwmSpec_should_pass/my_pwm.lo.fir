circuit my_pwm :
  module my_pwm :
    input clock : Clock
    input reset : UInt<1>
    input io_in : UInt<32>
    output io_dout : UInt<1>

    reg io_dout_cntReg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), io_dout_cntReg) @[my_pwm.scala 9:27]
    node _io_dout_cntReg_T = eq(io_dout_cntReg, UInt<4>("h9")) @[my_pwm.scala 10:28]
    node _io_dout_cntReg_T_1 = add(io_dout_cntReg, UInt<1>("h1")) @[my_pwm.scala 10:60]
    node _io_dout_cntReg_T_2 = tail(_io_dout_cntReg_T_1, 1) @[my_pwm.scala 10:60]
    node _io_dout_cntReg_T_3 = mux(_io_dout_cntReg_T, UInt<1>("h0"), _io_dout_cntReg_T_2) @[my_pwm.scala 10:20]
    node _io_dout_T = gt(io_in, io_dout_cntReg) @[my_pwm.scala 11:11]
    io_dout <= _io_dout_T @[my_pwm.scala 14:11]
    io_dout_cntReg <= mux(reset, UInt<4>("h0"), _io_dout_cntReg_T_3) @[my_pwm.scala 10:14 9:{27,27}]
