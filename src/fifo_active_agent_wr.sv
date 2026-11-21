class fifo_active_agent_wr extends uvm_agent;
  `uvm_component_utils(fifo_active_agent_wr)
  
  fifo_driver_wr drv_wr;
  fifo_monitor_wr mon_wr;
  fifo_sequencer_wr seqr_wr;
  
  function new(string name="fifo_active_agent_wr", uvm_component parent);
    super.new(name,parent);
   endfunction
  
  function void build_phase( uvm_phase phase);
    super.build_phase(phase);
    drv_wr=fifo_driver_wr::type_id::create("drv_wr",this);
    mon_wr=fifo_monitor_wr::type_id::create("mon_wr",this);
    seqr_wr=fifo_sequencer_wr::type_id::create("seqr_wr",this);
    endfunction
  
  function void connect_phase( uvm_phase phase);
    super.connect_phase(phase);
    drv_wr.seq_item_port.connect(seqr_wr.seq_item_export);
  endfunction
  
endclass
