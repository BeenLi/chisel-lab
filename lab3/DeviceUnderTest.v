module DeviceUnderTest(
  input        clock,
  input        reset,
  input  [1:0] io_a,
  input  [1:0] io_b,
  output [1:0] io_out
);
  assign io_out = io_a & io_b; // @[Mux2.scala 27:18]
endmodule
