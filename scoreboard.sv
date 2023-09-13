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

  
  
endclass
