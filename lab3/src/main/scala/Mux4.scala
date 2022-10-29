import chisel3._

/**
  * Use Mux2 components to build a 4:1 multiplexer
  */

class Mux4 extends Module {
  val io = IO(new Bundle {
    val a = Input(UInt(1.W))
    val b = Input(UInt(1.W))
    val c = Input(UInt(1.W))
    val d = Input(UInt(1.W))
    val sel = Input(UInt(2.W))
    val y = Output(UInt(1.W))
  })

  // ***** your code starts here *****
  val mux2_a = Module(new Mux2())
  val mux2_b = Module(new Mux2())
  val mux2_c = Module(new Mux2())

  mux2_a.io.a := io.a
  mux2_a.io.b := io.b
  mux2_a.io.sel := io.sel(0)

  mux2_b.io.a := io.c
  mux2_b.io.b := io.d
  mux2_b.io.sel := io.sel(0)

  mux2_c.io.a := mux2_a.io.y
  mux2_c.io.b := mux2_b.io.y
  mux2_c.io.sel := io.sel(1)

  io.y := mux2_c.io.y
  // create a Mux4 component out of Mux2 components
  // and connect the input and output ports.

  // below is dummy code to make this example compile
  //  io.y := io.c

  // ***** your code ends here *****
}