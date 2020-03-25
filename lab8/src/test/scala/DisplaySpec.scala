import chisel3.iotesters.PeekPokeTester
import org.scalatest._

class DisplayTest(dut: Display) extends PeekPokeTester(dut) {

  poke(dut.io.sw, 0x1234)
  step(200)
}

class DisplaySpec extends FlatSpec with Matchers {
  "DisplayTest " should "pass" in {
    chisel3.iotesters.Driver.execute(Array("--generate-vcd-output", "on"), () => new Display(20))
    { c => new DisplayTest(c)} should be (true)
  }
}
