class fifo_cfg extends uvm_object;
  `uvm_object_utils(fifo_cfg);
  
  function new(string name="fifo_cfg");
    super.new(name);
  endfunction
  
  virtual fifo_if fifo_inf;
  
endclass

  
