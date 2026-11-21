
class fifo_sequence extends uvm_sequence#(fifo_seq_item);
  `uvm_object_utils(fifo_sequence)
  
  function new(string name="fifo_sequence");
    super.new(name);
  endfunction
  task body();
    repeat(5) begin
      `uvm_do_with(req,{wr_cs==1;wr_en==1;})
    end
    `uvm_do_with(req,{wr_cs==0;wr_en==0;})
  endtask
endclass


class fifo_rd extends uvm_sequence#(fifo_seq_item);
  `uvm_object_utils(fifo_rd)
  
  function new(string name="fifo_rd");
    super.new(name);
    endfunction
  task body();
    repeat(5) begin
      `uvm_do_with(req,{rd_cs==1;rd_en==1;})
    end
    `uvm_do_with(req,{rd_cs==0;rd_en==0;})
  endtask
endclass

class fifo_rd_em extends uvm_sequence#(fifo_seq_item);
  `uvm_object_utils(fifo_rd_em)
  
  function new(string name="fifo_rd_em");
    super.new(name);
    endfunction
  task body();
    repeat(7) begin
      `uvm_do_with(req,{rd_cs==1;rd_en==1;})
    end
    `uvm_do_with(req,{rd_cs==0;rd_en==0;})
  endtask
endclass


class min_max_seq extends uvm_sequence#(fifo_seq_item);
  `uvm_object_utils(min_max_seq)
  
  function new(string name="min_max_seq");
    super.new(name);
    endfunction
  task body();
    `uvm_do_with(req,{wr_cs==1;wr_en==1;data_in==0;})
    `uvm_do_with(req,{wr_cs==1;wr_en==1;data_in==8'd255;})
    `uvm_do_with(req,{wr_cs==0;wr_en==0;})
  endtask
endclass

class wr_cs_0_seq extends uvm_sequence#(fifo_seq_item);
  `uvm_object_utils(wr_cs_0_seq)
  
  function new(string name="wr_cs_0_seq");
    super.new(name);
    endfunction
  task body();
    `uvm_do_with(req,{wr_cs==0;wr_en==1;})
    `uvm_do_with(req,{wr_cs==0;wr_en==0;})
  endtask
endclass

class wr_en_0_seq extends uvm_sequence#(fifo_seq_item);
  `uvm_object_utils(wr_en_0_seq)
  
  function new(string name="wr_en_0_seq");
    super.new(name);
    endfunction
  task body();
    `uvm_do_with(req,{wr_cs==1;wr_en==0;})
    `uvm_do_with(req,{wr_cs==0;wr_en==0;})
  endtask
endclass


class rd_en_0_seq extends uvm_sequence#(fifo_seq_item);
  `uvm_object_utils(rd_en_0_seq)
  
  function new(string name="rd_en_0_seq");
    super.new(name);
    endfunction
  task body();
    `uvm_do_with(req,{rd_cs==1;rd_en==0;})
    `uvm_do_with(req,{rd_cs==0;rd_en==0;})
  endtask
endclass

class rd_cs_0_seq extends uvm_sequence#(fifo_seq_item);
  `uvm_object_utils(rd_cs_0_seq)
  
  function new(string name="rd_cs_0_seq");
    super.new(name);
    endfunction
  task body();
    `uvm_do_with(req,{rd_cs==0;rd_en==1;})
    `uvm_do_with(req,{rd_cs==0;rd_en==0;})
  endtask
endclass

class fifo_wr_full extends uvm_sequence#(fifo_seq_item);
  `uvm_object_utils(fifo_wr_full)
  
  function new(string name="fifo_wr_full");
    super.new(name);
    endfunction
  task body();
    repeat(256) begin
      `uvm_do_with(req,{wr_cs==1;wr_en==1;})
    end
    `uvm_do_with(req,{wr_cs==0;wr_en==0;})
  endtask
endclass


class fifo_rd_empty extends uvm_sequence#(fifo_seq_item);
  `uvm_object_utils(fifo_rd_empty)
  function new(string name="fifo_rd_empty");
    super.new(name);
    endfunction
  task body();
    repeat(256) begin
      `uvm_do_with(req,{rd_cs==1;rd_en==1;})
    end
        `uvm_do_with(req,{rd_cs==0;rd_en==0;})
  endtask
endclass

