circuit Count6 :
  module Count6 :
    input clock : Clock
    input reset : UInt<1>
    output io_dout : UInt<8>

    node res = UInt<1>("h0") @[Count6.scala 8:17 12:7]
    io_dout <= pad(res, 8) @[Count6.scala 16:11]
