circuit Decoder :
  module Decoder :
    input clock : Clock
    input reset : UInt<1>
    input io_sel : UInt<2>
    output io_out : UInt<4>

    node _T = eq(UInt<1>("h0"), io_sel) @[Decoder.scala 14:15]
    node _dec_T = shl(UInt<1>("h1"), 0) @[Decoder.scala 16:18]
    node _T_1 = eq(UInt<1>("h1"), io_sel) @[Decoder.scala 14:15]
    node _dec_T_1 = shl(UInt<1>("h1"), 1) @[Decoder.scala 19:18]
    node _T_2 = eq(UInt<2>("h2"), io_sel) @[Decoder.scala 14:15]
    node _dec_T_2 = shl(UInt<1>("h1"), 2) @[Decoder.scala 22:18]
    node _T_3 = eq(UInt<2>("h3"), io_sel) @[Decoder.scala 14:15]
    node _dec_T_3 = shl(UInt<1>("h1"), 3) @[Decoder.scala 25:18]
    node _GEN_0 = mux(_T_3, _dec_T_3, UInt<1>("h0")) @[Decoder.scala 14:15 25:11]
    node _GEN_1 = mux(_T_2, _dec_T_2, _GEN_0) @[Decoder.scala 14:15 22:11]
    node _GEN_2 = mux(_T_1, _dec_T_1, _GEN_1) @[Decoder.scala 14:15 19:11]
    node _GEN_3 = mux(_T, _dec_T, _GEN_2) @[Decoder.scala 14:15 16:11]
    node dec = _GEN_3
    io_out <= dec @[Decoder.scala 31:10]
