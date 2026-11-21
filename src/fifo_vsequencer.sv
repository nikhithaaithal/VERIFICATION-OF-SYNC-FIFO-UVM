class fifo_vsequencer extends uvm_sequencer;
  `uvm_component_utils(fifo_vsequencer)
  
  fifo_sequencer_wr seqr_wr;
  fifo_sequencer_rd seqr_rd;
  
  virtual fifo_if vif;
  fifo_cfg cfg;

  
  function new(string name="fifo_sequencer",uvm_component parent);
    super.new(name, parent);
   endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(fifo_cfg)::get(this, "", "fifo_cfg", cfg))
      `uvm_fatal(get_type_name(), "cfg not found")
    vif = cfg.fifo_inf;
  endfunction
endclass
  
  
  
