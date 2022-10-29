circuit myMux :
  module myMux :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip a : UInt<2>, flip b : UInt<2>, flip sel : UInt<1>, out : UInt<2>}

    wire w : UInt<2> @[Mux2.scala 37:15]
    node _T = eq(io.sel, UInt<1>("h1")) @[Mux2.scala 38:16]
    when _T : @[Mux2.scala 38:25]
      w <= io.a @[Mux2.scala 39:7]
    else :
      w <= io.b @[Mux2.scala 41:7]
    io.out <= w @[Mux2.scala 43:10]

