class fifo_monitor_wr extends uvm_monitor;
  `uvm_component_utils(fifo_monitor_wr)
  
  uvm_analysis_port#(fifo_seq_item)wr_port;
  virtual fifo_if.MON_WR inf;
  fifo_cfg cfg;
  fifo_seq_item tr;
  
  function new(string name="fifo_monitor_wr",uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(fifo_cfg)::get(this,"","fifo_cfg",cfg))
      `uvm_fatal(get_type_name(),"Monitor failed")
      wr_port=new("wr_port",this);
   endfunction
  
  function void connect_phase (uvm_phase phase);
    super.connect_phase(phase);
    inf=cfg.fifo_inf;
  endfunction
  
  task run_phase(uvm_phase phase);
   
    forever begin
       @(inf.mon_wr_cb);
      if(inf.mon_wr_cb.wr_cs && inf.mon_wr_cb.wr_en)
        begin
          tr=fifo_seq_item::type_id::create("tr");
          tr.wr_cs    = inf.mon_wr_cb.wr_cs;
          tr.wr_en    = inf.mon_wr_cb.wr_en;
          tr.data_in  = inf.mon_wr_cb.data_in;
          tr.full     = inf.mon_wr_cb.full;
          wr_port.write(tr);
          `uvm_info(get_type_name,$sformatf("data_in=%h,full=%h",tr.data_in,  tr.full),UVM_NONE)
         
        end
    end
  endtask
  
endclass
   

      
      
  
  
    
