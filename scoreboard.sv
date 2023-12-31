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
    bit [127:0] data;
    if(item_got1.i_wren=='b1)
      begin
        if(queue.size()<1024)
          begin
            queue.push_back(item_got1.i_wren);
            if(queue.size()>1020 && queue.size()<1024)
              begin
                $display("Almost full condition: o_alm_full=%0b",item_got2.o_alm_full);
              end
            `uvm_info("Data write operation", $sformatf("i_wren: %0b i_rden: %0b i_wrdata: %0d o_full: %0b o_alm_full: %0b",item_got1.i_wren, item_got1.i_rden,item_got1.i_wrdata, item_got2.o_full,item_got2.o_alm_full), UVM_LOW);
          end
      end

    if (item_got1.i_rden == 'b1)
      begin
      if(queue.size() >= 'd1)
        begin
         data = queue.pop_front();
          if(queue.size()>0 && queue.size()<2)
            begin
              $display("Almost empty condition : o_alm_empty=%0b",item_got2.o_alm_empty);
            end
          `uvm_info("Data read operation", $sformatf("data: %0d o_rddata: %0d o_empty: %0b o_alm_empty: %0b", data, item_got2.o_rddata, item_got2.o_empty ,item_got2.o_alm_empty), UVM_LOW);
          if(data == item_got2.o_rddata)
        $display("-----------Pass!-----------");
          else
        $display("-----------Fail!-----------");
        end
      end
  endfunction
endclass
