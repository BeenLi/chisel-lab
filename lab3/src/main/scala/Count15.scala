import chisel3._

class Count15 extends Module {
  val io = IO(new Bundle {
    val dout = Output(UInt(8.W))
  })

  val res = Wire(UInt())

  // ***** your code starts here *****

//  res := 0.U // dummy code to make it compile

  // 需要指定位宽，否则推断可能不知道，弄成了1
   val counter_reg = RegInit(0.U(4.W))
  counter_reg := counter_reg + 1.U(4.W)
   res := counter_reg
  // ***** your code ends here *****

  io.dout := res
}