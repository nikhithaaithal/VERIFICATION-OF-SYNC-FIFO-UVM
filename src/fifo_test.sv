class fifo_test extends uvm_test;
  `uvm_component_utils(fifo_test)
  fifo_env env;
  virtual fifo_if inf;
  fifo_cfg cfg;
 
  function new(string name="fifo_test",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    cfg=fifo_cfg::type_id::create("cfg");
    if(!uvm_config_db#(virtual fifo_if)::get(this,"","inf",cfg.fifo_inf))
      `uvm_fatal(get_type_name(),"test_failed")
      uvm_config_db#(fifo_cfg)::set(this,"*","fifo_cfg",cfg);
    env=fifo_env::type_id::create("env",this);
  endfunction
  
  function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    uvm_top.print_topology();
  endfunction
   
endclass
  
class write_read extends fifo_test;
  `uvm_component_utils(write_read)
   fifo_vsequence vseq;
  
  function new(string name="write_read",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
  
   task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    vseq=fifo_vsequence::type_id::create("vseq");
    vseq.start(env.vseqr);
    #25;
    phase.drop_objection(this);
  endtask
endclass

class read_empty extends fifo_test;
  `uvm_component_utils(read_empty)
   read_empty_vseq vseq;
  
  function new(string name="read_empty",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
  
  task run_phase(uvm_phase phase);
    
    phase.raise_objection(this);
    vseq=read_empty_vseq::type_id::create("vseq");
    vseq.start(env.vseqr);
    #25;
    phase.drop_objection(this);
  endtask
  
endclass
       

class write_full extends fifo_test;
  `uvm_component_utils(write_full)
  write_full_vseq vseq;
  
  function new(string name="write_full",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
  
  task run_phase(uvm_phase phase);
    
    phase.raise_objection(this);
    vseq=write_full_vseq::type_id::create("vseq");
    vseq.start(env.vseqr);
    #25;
    phase.drop_objection(this);
  endtask
  
endclass
     

class write_full_read_empty extends fifo_test;
  `uvm_component_utils(write_full_read_empty)
  write_full_read_empty_vseq vseq;
  
  function new(string name="write_full_read_empty",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
  
  task run_phase(uvm_phase phase);
    
    phase.raise_objection(this);
    vseq=write_full_read_empty_vseq::type_id::create("vseq");
    vseq.start(env.vseqr);
    #25;
    phase.drop_objection(this);
  endtask
  
endclass


class sim_rd_wr extends fifo_test;
  `uvm_component_utils(sim_rd_wr)
  sim_vseq vseq;
  
  function new(string name="sim_rd_wr",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
  
  task run_phase(uvm_phase phase);
    
    phase.raise_objection(this);
    vseq=sim_vseq::type_id::create("vseq");
    vseq.start(env.vseqr);
    #50;
    phase.drop_objection(this);
  endtask
  
endclass
  
class read_write extends fifo_test;
  `uvm_component_utils(read_write)
  read_write_vseq vseq;
  
  function new(string name="read_write",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
  
  task run_phase(uvm_phase phase);
    
    phase.raise_objection(this);
    vseq=read_write_vseq::type_id::create("vseq");
    vseq.start(env.vseqr);
    #50;
    phase.drop_objection(this);
  endtask
  
endclass
  
class min_max extends fifo_test;
  `uvm_component_utils(min_max)
  min_max_vseq vseq;
  
  function new(string name="min_max",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
  
  task run_phase(uvm_phase phase);
    
    phase.raise_objection(this);
    vseq=min_max_vseq::type_id::create("vseq");
    vseq.start(env.vseqr);
    #50;
    phase.drop_objection(this);
  endtask
  
endclass
  
class wr_cs_0 extends fifo_test;
  `uvm_component_utils(wr_cs_0)
  wr_cs_0_vseq vseq;
  
  function new(string name="wr_cs_0",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
  
  task run_phase(uvm_phase phase);
    
    phase.raise_objection(this);
    vseq=wr_cs_0_vseq::type_id::create("vseq");
    vseq.start(env.vseqr);
    #50;
    phase.drop_objection(this);
  endtask
  
endclass 
  
class wr_en_0 extends fifo_test;
  `uvm_component_utils(wr_en_0)
  wr_en_0_vseq vseq;
  
  function new(string name="wr_en_0",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
  
  task run_phase(uvm_phase phase);
    
    phase.raise_objection(this);
    vseq=wr_en_0_vseq::type_id::create("vseq");
    vseq.start(env.vseqr);
    #50;
    phase.drop_objection(this);
  endtask
  
endclass
  
  
class rd_en_0 extends fifo_test;
  `uvm_component_utils(rd_en_0)
  rd_en_0_vseq vseq;
  
  function new(string name="rd_en_0",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
  
  task run_phase(uvm_phase phase);
    
    phase.raise_objection(this);
    vseq=rd_en_0_vseq::type_id::create("vseq");
    vseq.start(env.vseqr);
    #50;
    phase.drop_objection(this);
  endtask
  
endclass
  
class rd_cs_0 extends fifo_test;
  `uvm_component_utils(rd_cs_0)
  rd_cs_0_vseq vseq;
  
  function new(string name="rd_cs_0",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
  
  task run_phase(uvm_phase phase);
    
    phase.raise_objection(this);
    vseq=rd_cs_0_vseq::type_id::create("vseq");
    vseq.start(env.vseqr);
    #50;
    phase.drop_objection(this);
  endtask
  
endclass
