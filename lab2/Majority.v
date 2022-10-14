module Majority(
  input   clock,
  input   reset,
  input   io_a,
  input   io_b,
  input   io_c,
  output  io_out
);
  assign io_out = io_a & io_b | io_a & io_c | io_b & io_c; // @[Majority.scala 23:31]
endmodule
