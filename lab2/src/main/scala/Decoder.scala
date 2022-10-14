import chisel3._
import chisel3.util._

class Decoder extends Module {
  val io = IO(new Bundle {
    val sel = Input(UInt(2.W))
    val out = Output(UInt(4.W))
  })

  val sel = io.sel
  val dec = WireDefault(0.U)

  // ***** your code starts here *****
  switch(sel) {
    is(0.U) {
      dec := 1.U <<0
    }
    is(1.U){
      dec := 1.U <<1
    }
    is(2.U){
      dec := 1.U <<2
    }
    is(3.U){
      dec := 1.U <<3
    }
  }

  // ***** your code ends here *****

  io.out := dec
}


