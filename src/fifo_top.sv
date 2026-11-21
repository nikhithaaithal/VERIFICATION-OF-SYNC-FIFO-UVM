
`include "defines.svh"
`include "fifo_if.sv"
`include "pkg.sv"
`include "sync_fifo.v"
`include "fifo_assertion.sv"

module fifo_top;
  
  import uvm_pkg::*;
  import pkg::*;
  bit clk=0;
  bit rst;
  fifo_if duv_if(clk,rst);
  
  always #5 clk=~clk;
  
  initial begin
    rst=0;
    #3;
    rst=1;
    #3;
    rst=0;
  end
  
  syn_fifo #(
	.DATA_WIDTH(`DATA_WIDTH),
	.ADDR_WIDTH(`ADDR_WIDTH)
) duv (
	.clk      (clk),
	.rst      (rst),
	.wr_cs    (duv_if.wr_cs),
	.rd_cs    (duv_if.rd_cs),
	.data_in  (duv_if.data_in),
	.rd_en    (duv_if.rd_en),
	.wr_en    (duv_if.wr_en),
	.data_out (duv_if.data_out),
	.empty    (duv_if.empty),
	.full     (duv_if.full)
);
  
bind syn_fifo fifo_asssertion fifo_assert_inst (
    .clk    (clk),
    .rst    (rst),
    .rd_cs  (rd_cs),
    .wr_cs  (wr_cs),
    .rd_en  (rd_en),
    .wr_en  (wr_en),
    .full   (full),
    .empty  (empty)
);
  
  initial begin
    uvm_config_db#(virtual fifo_if)::set(null,"uvm_test_top","inf",duv_if);
    run_test();
  end
  
endmodule
  
