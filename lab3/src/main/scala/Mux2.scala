import chisel3._

/**
  * Mux2 is a simple one-bit multiplexer.
  * Use it in UseMux2 and to build the Mux4 circuit.
  */

class Mux2 extends Module {
  val io = IO(new Bundle {
    val a = Input(UInt(1.W))
    val b = Input(UInt(1.W))
    val sel = Input(UInt(1.W))
    val y = Output(UInt(1.W))
  })

  io.y := io.a
  when (io.sel === 1.U) {
    io.y := io.b
  }
}
class DeviceUnderTest extends Module {
  val io = IO(new Bundle {
    val a = Input(UInt(2.W))
    val b = Input(UInt(2.W))
    val out = Output(UInt(2.W))
  })
  io.out := io.a & io.b
}

class myMux extends Module {
  val io = IO(new Bundle {
    val a = Input(UInt(2.W))
    val b = Input(UInt(2.W))
    val sel = Input(UInt(1.W))
    val out = Output(UInt(2.W))
  })
  val w = Wire(UInt(2.W))
  when (io.sel === 1.U) {
    w := io.a
  } otherwise {
    w := io.b
  }
  io.out := w
}
object Hello extends App {
  emitVerilog(new DeviceUnderTest())
  emitVerilog(new myMux())
}
