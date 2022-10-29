import chisel3._

class Delay extends Module {
  val io = IO(new Bundle {
    val din = Input(UInt(8.W))
    val dout = Output(UInt(8.W))
  })

  val res = Wire(UInt())

  // ***** your code starts here *****

  // below is dummy code to make this example compile
  // res := io.din
  // --------- version 1 ----------------

  //  val reg1 = RegInit(0.U(8.W))
  //  val reg2 = RegInit(0.U(8.W))
  //  reg1 := io.din
  //  reg2 := reg1
  //  res := reg2

  // --------- version 2 --------------
  res := RegNext(RegNext(io.din, 0.U), 0.U)
  // ***** your code ends here *****

  io.dout := res
}