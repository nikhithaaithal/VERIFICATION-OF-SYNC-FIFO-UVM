module fifo_asssertion(
     input bit clk,
     input logic rst,
     input logic rd_cs,
     input logic wr_cs,
     input logic rd_en,
     input logic wr_en,
     input logic full,
     input logic empty);
  /*   
property p1;
@(posedge clk)
 full|-> !empty;
endproperty
assert property(p1);

assert property (
  @(posedge clk)
  rst |-> (empty && !full)
);
*/
property p2;
 @(posedge clk)disable iff (rst)
 (full && wr_cs && wr_en) |=> full;
endproperty
assert property(p2);

property p3;
@(posedge clk)disable iff (rst)
 (empty&& rd_cs && rd_en) |=> empty;
endproperty
assert property(p3);

endmodule
