class fifo_active_agent_rd extends uvm_agent;
  `uvm_component_utils(fifo_active_agent_rd)
  
  fifo_driver_rd drv_rd;
  fifo_monitor_rd mon_rd;
  fifo_sequencer_rd seqr_rd;
  
  function new(string name="fifo_active_agent_rd", uvm_component parent);
    super.new(name,parent);
   endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    drv_rd=fifo_driver_rd::type_id::create("drv_rd",this);
    mon_rd=fifo_monitor_rd::type_id::create("mon_rd",this);
    seqr_rd=fifo_sequencer_rd::type_id::create("seqr_rd",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    drv_rd.seq_item_port.connect(seqr_rd.seq_item_export);
  endfunction
  
endclass
