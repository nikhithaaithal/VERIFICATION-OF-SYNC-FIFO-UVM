class fifo_monitor_rd extends uvm_monitor;
  `uvm_component_utils(fifo_monitor_rd)
  
  fifo_seq_item tr;
  virtual fifo_if.MON_RD inf;
  uvm_analysis_port#(fifo_seq_item)rd_port;
  fifo_cfg cfg;
  
  function new(string name="fifo_monitor_rd", uvm_component parent);
    super.new(name,parent);
   endfunction
   
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(fifo_cfg)::get(this,"","fifo_cfg",cfg))
      `uvm_fatal(get_type_name(),"Monitor failed")
      rd_port=new("rd_Port",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    inf=cfg.fifo_inf;
  endfunction
  
  task run_phase(uvm_phase phase);
  bit rd_pending;
  bit emp;
  forever begin
    @(inf.mon_rd_cb);
    if (rd_pending) begin
      tr = fifo_seq_item::type_id::create("tr");
      tr.rd_cs    = 1;
      tr.rd_en    = 1;
      tr.data_out = inf.mon_rd_cb.data_out;
      tr.empty    = emp;
      rd_port.write(tr);
      `uvm_info(get_type_name(), $sformatf("data_out=%h,empty=%h", tr.data_out, tr.empty), UVM_NONE)
    end
    rd_pending = inf.mon_rd_cb.rd_cs && inf.mon_rd_cb.rd_en;
    emp=inf.mon_rd_cb.empty;
  end
endtask
endclass

        
