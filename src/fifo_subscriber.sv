class fifo_subscriber extends uvm_subscriber#(fifo_seq_item);
  `uvm_component_utils(fifo_subscriber)
  fifo_seq_item t;
  covergroup cg;
    c1:coverpoint t.data_in{
      bins b1={[0:80]};
      bins b2={[81:168]};
      bins b3={[169:255]};
    }
    c2:coverpoint t.wr_cs{
      bins b1={1};
    }
    c3:coverpoint t.wr_en{
      bins b1={1};
    }
    c4:coverpoint t.rd_cs{
      bins b1={1};
    }
    c5:coverpoint t.rd_en{
      bins b1={1};
    }
  endgroup
  
   function new(string name="fifo_subscriber ",uvm_component parent);
     super.new(name,parent);
     cg=new();
   endfunction
  
  function void write(fifo_seq_item t);
     this.t = t;
     cg.sample();
  endfunction
  
endclass
  
  
   
  
