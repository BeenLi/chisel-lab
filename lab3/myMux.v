module myMux(
  input        clock,
  input        reset,
  input  [1:0] io_a,
  input  [1:0] io_b,
  input        io_sel,
  output [1:0] io_out
);
  assign io_out = io_sel ? io_a : io_b; // @[Mux2.scala 38:25 39:7 41:7]
endmodule
