class fifo_driver_wr extends uvm_driver#(fifo_seq_item);
  `uvm_component_utils(fifo_driver_wr);
  
  virtual fifo_if.DRV_WR vif;
  fifo_cfg cfg;
  
  function new(string name="fifo_driver_wr",uvm_component parent);
    super.new(name,parent);
    endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(fifo_cfg)::get(this,"", "fifo_cfg", cfg))
       `uvm_fatal(get_type_name(),"Driver Failed")
  endfunction
      
      
    function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      vif=cfg.fifo_inf;
    endfunction

  
  task run_phase(uvm_phase phase);
   @(vif.drv_wr_cb);
     vif.drv_wr_cb.wr_cs<=0;
     vif.drv_wr_cb.wr_en<=0;
    forever begin
      seq_item_port.get_next_item(req);
      @(vif.drv_wr_cb);
      vif.drv_wr_cb.wr_cs<=req.wr_cs;
      vif.drv_wr_cb.wr_en<=req.wr_en;
      vif.drv_wr_cb.data_in<=req.data_in;
      `uvm_info(get_type_name,$sformatf("wd_cs=%h,wd_en=%h, data_in=%h",req.wr_cs, req.wr_en,req.data_in),UVM_NONE)
      seq_item_port.item_done();
    end
  endtask
endclass

