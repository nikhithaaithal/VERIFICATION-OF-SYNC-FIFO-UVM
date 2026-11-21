class fifo_vsequence extends uvm_sequence;
  `uvm_object_utils(fifo_vsequence)
  `uvm_declare_p_sequencer(fifo_vsequencer)
  
  function new(string name="fifo_vsequence");
    super.new(name);
    endfunction
  
  task body();
    fifo_sequence wr;
    fifo_rd rd;
    wr=fifo_sequence::type_id::create("wr");
    rd=fifo_rd::type_id::create("rd");
    wr.start(p_sequencer.seqr_wr);
    rd.start(p_sequencer.seqr_rd);
  endtask
endclass

class write_full_vseq extends uvm_sequence;
  `uvm_object_utils(write_full_vseq)
  `uvm_declare_p_sequencer(fifo_vsequencer)
  function new(string name="write_full_vseq");
    super.new(name);
    endfunction
  
  task body();
    fifo_wr_full wr;
    wr=fifo_wr_full::type_id::create("wr");
    wr.start(p_sequencer.seqr_wr);
  endtask
endclass


class read_empty_vseq extends uvm_sequence;
  `uvm_object_utils(read_empty_vseq)
  `uvm_declare_p_sequencer(fifo_vsequencer)
  function new(string name="read_empty_vseq");
    super.new(name);
    endfunction
  
  task body();
    fifo_sequence wr;
    fifo_rd_em rd;
    wr=fifo_sequence::type_id::create("wr");
    rd=fifo_rd_em::type_id::create("rd");
    wr.start(p_sequencer.seqr_wr);
    rd.start(p_sequencer.seqr_rd);
  endtask
endclass


class sim_vseq extends uvm_sequence;
  `uvm_object_utils(sim_vseq)
  `uvm_declare_p_sequencer(fifo_vsequencer)
  function new(string name="sim_vseq");
    super.new(name);
    endfunction
  
  task body();
    fifo_sequence wr;
    fifo_rd rd;
    wr=fifo_sequence::type_id::create("wr");
    rd=fifo_rd::type_id::create("rd");
    fork 
    wr.start(p_sequencer.seqr_wr);
    rd.start(p_sequencer.seqr_rd);
    join 
  endtask
endclass

class read_write_vseq extends uvm_sequence;
  `uvm_object_utils(read_write_vseq)
  `uvm_declare_p_sequencer(fifo_vsequencer)
  function new(string name="read_write_vseq");
    super.new(name);
    endfunction
  
 task body();
    fifo_sequence wr;
    fifo_rd rd;
    wr=fifo_sequence::type_id::create("wr");
    rd=fifo_rd::type_id::create("rd");
    wr.start(p_sequencer.seqr_wr);
    rd.start(p_sequencer.seqr_rd);
    wr.start(p_sequencer.seqr_wr);
    rd.start(p_sequencer.seqr_rd);
  endtask
endclass


class min_max_vseq extends uvm_sequence;
  `uvm_object_utils(min_max_vseq)
  `uvm_declare_p_sequencer(fifo_vsequencer)
  function new(string name="min_max_vseq");
    super.new(name);
    endfunction
  
  task body();
    min_max_seq wr;
    fifo_rd rd;
    wr=min_max_seq::type_id::create("wr");
    wr.start(p_sequencer.seqr_wr);
    rd=fifo_rd::type_id::create("rd");
    rd.start(p_sequencer.seqr_rd);
  endtask
endclass

class wr_cs_0_vseq extends uvm_sequence;
  `uvm_object_utils(wr_cs_0_vseq)
  `uvm_declare_p_sequencer(fifo_vsequencer)
  function new(string name="wr_cs_0_vseq");
    super.new(name);
    endfunction
  
  task body();
    wr_cs_0_seq wr;
    wr=wr_cs_0_seq::type_id::create("wr");
    wr.start(p_sequencer.seqr_wr);
    
  endtask
endclass

class wr_en_0_vseq extends uvm_sequence;
  `uvm_object_utils(wr_en_0_vseq)
  `uvm_declare_p_sequencer(fifo_vsequencer)
  function new(string name="wr_en_0_vseq");
    super.new(name);
    endfunction
  
  task body();
    wr_en_0_seq wr;
    wr=wr_en_0_seq::type_id::create("wr");
    wr.start(p_sequencer.seqr_wr);
    
  endtask
endclass

class rd_en_0_vseq extends uvm_sequence;
  `uvm_object_utils(rd_en_0_vseq)
  `uvm_declare_p_sequencer(fifo_vsequencer)
  function new(string name="rd_en_0_vseq");
    super.new(name);
    endfunction
  
  task body();
    rd_en_0_seq wr;
    wr=rd_en_0_seq::type_id::create("wr");
    wr.start(p_sequencer.seqr_rd);
    
  endtask
endclass

class rd_cs_0_vseq extends uvm_sequence;
  `uvm_object_utils(rd_cs_0_vseq)
  `uvm_declare_p_sequencer(fifo_vsequencer)
  function new(string name="rd_cs_0_vseq");
    super.new(name);
    endfunction
  
  task body();
    rd_cs_0_seq wr;
    wr=rd_cs_0_seq::type_id::create("wr");
    wr.start(p_sequencer.seqr_rd);
    
  endtask
endclass

class write_full_read_empty_vseq extends uvm_sequence;
  `uvm_object_utils(write_full_read_empty_vseq)
  `uvm_declare_p_sequencer(fifo_vsequencer)
  function new(string name="write_full_read_empty_vseq");
    super.new(name);
    endfunction
  
  task body();
    fifo_wr_full wr;
    fifo_rd_empty rd;
    wr=fifo_wr_full::type_id::create("wr");
    rd=fifo_rd_empty::type_id::create("rd");
    wr.start(p_sequencer.seqr_wr);
    rd.start(p_sequencer.seqr_rd);
  endtask
endclass
