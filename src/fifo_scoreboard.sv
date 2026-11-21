
class fifo_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(fifo_scoreboard)
  
  uvm_tlm_analysis_fifo#(fifo_seq_item)wr;
  uvm_tlm_analysis_fifo#(fifo_seq_item)rd;
  
  logic[`DATA_WIDTH-1:0]queue[$];
  logic[`DATA_WIDTH-1:0]rdata;
  
  fifo_seq_item wr_tr;
  fifo_seq_item rd_tr;
  
  function new(string name="fifo_scoreboard",uvm_component parent);
    super.new(name,parent);
    wr=new("wr",this);
    rd=new("rd",this);
  endfunction
  
  
  task run_phase(uvm_phase phase);
    fork 
      begin
        forever begin
          wr.get(wr_tr);
          write(wr_tr);
        end
      end
      begin
         forever begin
           rd.get(rd_tr);
           read( rd_tr);
         end
      end
    join_none
  endtask
  
  function void read(fifo_seq_item tr);
    if (tr.empty) begin
      `uvm_info(get_type_name(), "Read on empty ignored ", UVM_LOW)
      return;
    end
    if (queue.size() == 0) begin
      `uvm_error(get_type_name(), "Qualified read but expected queue is empty")
      return;
    end
    rdata = queue.pop_front();
    if (tr.data_out !== rdata)
      `uvm_error(get_type_name(),
        $sformatf("Data_Out not correct data_out=%h, expected=%h", tr.data_out, rdata))
    else
      `uvm_info(get_type_name(), $sformatf("read_data=%h", rdata), UVM_LOW)
  endfunction

  function void write(fifo_seq_item tr);
    if (tr.full) begin
      `uvm_info(get_type_name(), "Write on full ignored", UVM_LOW)
      return;
    end
    queue.push_back(tr.data_in);
    `uvm_info(get_type_name(), $sformatf("data_in=%h", tr.data_in), UVM_LOW)
  endfunction

  function void check_phase(uvm_phase phase);
    if (queue.size() != 0)
      `uvm_warning(get_type_name(),
        $sformatf("%0d entries still in the FIFO at end of test", queue.size()))
  endfunction
endclass   
    
          
    
    
    
    
    
    
    
    
    
 
