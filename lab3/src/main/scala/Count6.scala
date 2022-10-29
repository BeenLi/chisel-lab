import chisel3._

class Count6 extends Module {
  val io = IO(new Bundle {
    val dout = Output(UInt(8.W))
  })

  val res = Wire(UInt())

  // ***** your code starts here *****

//  res := 0.U // dummy code to make it compile

  val counter_reg = RegInit(0.U(4.W))
  counter_reg := counter_reg + 1.U(4.W)
  when (counter_reg === 6.U){
    counter_reg := 0.U
  }
  res := counter_reg
  // ***** your code ends here *****

  io.dout := res
}