import chisel3._

class Accu extends Module {
  val io = IO(new Bundle {
    val din = Input(UInt(8.W))
    val setZero = Input(Bool())
    val dout = Output(UInt(8.W))
  })

  val res = Wire(UInt())

  // ***** your code starts here *****

//  res := 0.U // dummy code to make it compile
  val accumulator_reg = RegInit(0.U(8.W))
  when (io.setZero){
    accumulator_reg := 0.U
  } .otherwise{
    accumulator_reg := accumulator_reg + io.din
  }
  res := accumulator_reg
  // ***** your code ends here *****

  io.dout := res
}