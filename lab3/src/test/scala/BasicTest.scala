import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class AnotherTest extends AnyFlatSpec with ChiselScalatestTester {
  "AnotherTest" should "do anything" in {
    test(new DeviceUnderTest) { c =>
      c.io.a.poke(0.U(2.W))
      c.io.b.poke(1.U(2.W))
      c.clock.step()
      c.io.out.expect(0.U)
      println("Last output value: " + c.io.out.peek().litValue)
    }
  }
}

class WaveformTest extends AnyFlatSpec with ChiselScalatestTester {
  it should "output waveform" in {
    test(new DeviceUnderTest) { c =>
      c.io.a.poke(0.U(2.W))
      c.io.b.poke(1.U(2.W))
      c.clock.step()
      c.io.out.expect(0.U)
      println("Last output value: " + c.io.out.peek().litValue)
    }
  }
}

class BasicTest extends AnyFlatSpec with ChiselScalatestTester {
  it should "do something" in {
    test(new DeviceUnderTest) { c =>
      c.io.a.poke(3.U(2.W))
      c.io.b.poke(1.U(2.W))
      c.clock.step()
      c.io.out.expect(1.U)
      println("Last output value: " + c.io.out.peek().litValue)
    }
  }
}