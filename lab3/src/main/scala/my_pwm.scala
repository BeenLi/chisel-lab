import chisel3._
import chisel3.util._
class my_pwm extends Module{
  var io = IO(new Bundle{
    val in = Input(UInt(32.W))
    val dout = Output(UInt(1.W))
  })
    def pwm(nrCycles: Int, din: UInt) = {
      val cntReg = RegInit(0.U(unsignedBitLength(nrCycles-1).W))
      cntReg := Mux(cntReg === (nrCycles-1).U, 0.U, cntReg + 1.U)
      din > cntReg
    }

  io.dout := pwm(10, io.in)

}
