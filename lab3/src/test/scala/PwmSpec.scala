import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class PwmSpec extends AnyFlatSpec with ChiselScalatestTester {
  "PwmSpec" should "pass" in {
    test(new my_pwm) { dut =>
      dut.io.in.poke(3.U)
      dut.clock.step(100)
      println("my_pwm(10, 3)")
    }
  }
}
