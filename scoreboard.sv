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
  
  function void write(input fifo_sequence_items item_got);
    bit [7:0] examdata;
    if(item_got.wr == 'b1)begin
      queue.push_back(item_got.data_in);
      `uvm_info("write Data", $sformatf("wr: %0b rd: %0b data_in: %0h full: %0b",item_got.wr, item_got.rd,item_got.data_in, item_got.full), UVM_LOW);
    end
    else if (item_got.rd == 'b1)begin
      if(queue.size() >= 'd1)begin
        examdata = queue.pop_front();
        `uvm_info("Read Data", $sformatf("examdata: %0h data_out: %0h empty: %0b", examdata, item_got.data_out, item_got.empty), UVM_LOW);
        if(examdata == item_got.data_out)begin
          $display("-------- 		Pass! 		--------");
        end
        else begin
          $display("--------		Fail!		--------");
          $display("--------		Check empty	--------");
        end
      end
    end
  endfunction
endclass
