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
            `uvm_info("Data write operation", $sformatf("i_wren: %0b i_rden: %0b i_wrdata: %0d o_full: %0b o_alm_full: %0b",item_got1.i_wren, item_got1.i_rden,item_got1.i_wrdata, item_got2.o_full,item_got2.o_alm_full), UVM_LOW);
          end
      end
  
  
endclass
