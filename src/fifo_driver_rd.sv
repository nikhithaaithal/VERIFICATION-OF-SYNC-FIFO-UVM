class fifo_driver_rd extends uvm_driver#(fifo_seq_item);
  `uvm_component_utils(fifo_driver_rd)
  
  function new(string name="fifo_driver_rd",uvm_component parent);
    super.new(name,parent);
    endfunction
  
  virtual fifo_if.DRV_RD vif;
  fifo_cfg cfg;
    
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(fifo_cfg)::get(this,"","fifo_cfg",cfg))
      `uvm_fatal(get_type_name(),"DRIVER FAILER")
   endfunction
      
      
    function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      vif=cfg.fifo_inf;
   endfunction
  
  task run_phase(uvm_phase phase);
    @(vif.drv_rd_cb);
    vif.drv_rd_cb.rd_cs<=0;
    vif.drv_rd_cb.rd_en<=0;
    forever begin
      seq_item_port.get_next_item(req);
      @(vif.drv_rd_cb);
      vif.drv_rd_cb.rd_cs<=req.rd_cs;
      vif.drv_rd_cb.rd_en<=req.rd_en;
      `uvm_info(get_type_name,$sformatf("rd_cs=%h,rd_en=%h",req.rd_cs, req.rd_en),UVM_NONE)
      seq_item_port.item_done();
    end
  endtask
endclass


