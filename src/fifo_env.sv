class fifo_env extends uvm_env;
  `uvm_component_utils(fifo_env)
  
  fifo_active_agent_wr agt_wr;
  fifo_active_agent_rd agt_rd;
  fifo_subscriber sub;
  fifo_scoreboard scb;
  fifo_vsequencer vseqr;
    
  function new(string name="fifo_env", uvm_component parent);
    super.new(name,parent);
   endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agt_wr=fifo_active_agent_wr::type_id::create("agt_wr",this);
    agt_rd=fifo_active_agent_rd::type_id::create("agt_rd",this);
    sub=fifo_subscriber::type_id::create("sub",this);
    scb=fifo_scoreboard::type_id::create("scb",this);
    vseqr=fifo_vsequencer::type_id::create("vseqr",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    agt_wr.mon_wr.wr_port.connect(scb.wr.analysis_export);
    agt_rd.mon_rd.rd_port.connect(scb.rd.analysis_export);
    agt_wr.mon_wr.wr_port.connect(sub.analysis_export);
    agt_rd.mon_rd.rd_port.connect(sub.analysis_export);
    vseqr.seqr_wr=agt_wr.seqr_wr;
    vseqr.seqr_rd=agt_rd.seqr_rd;
  endfunction
  
endclass

    
   
    
  
  
 
