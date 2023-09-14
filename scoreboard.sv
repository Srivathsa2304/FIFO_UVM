class fifo_scoreboard extends uvm_scoreboard;
  uvm_analysis_imp#(fifo_sequence_items, fifo_scoreboard) item_got_export1;
  uvm_analysis_imp#(fifo_sequence_items, fifo_scoreboard) item_got_export2;
  `uvm_component_utils(fifo_scoreboard)
  
  function new(string name = "fifo_scoreboard", uvm_component parent);
    super.new(name, parent);
    item_got_export1 = new("item_got_export1", this);
    item_got_export2 = new("item_got_export2", this);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction

  int queue[$];

  function void write(input fifo_sequence_items item_got1);
    bit [7:0] data;
    if(item_got1.i_wren=='b1)
      begin
        if(queue.size()<1024)
          begin
            queue.push_back(item_got1.i_wren);
             `uvm_info("write Data", $sformatf("wr: %0b rd: %0b data_in: %0h full: %0b",item_got.wr, item_got.rd,item_got.data_in, item_got.full), UVM_LOW);
        
  
  
endclass
