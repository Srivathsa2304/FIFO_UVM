class fifo_monitor extends uvm_monitor;
  virtual fifo_interface vif;
  fifo_sequence_items item_got;
  uvm_analysis_port#(fifo_sequence_items) item_got_port;
  `uvm_component_utils(fifo_monitor)
  
  function new(string name = "fifo_monitor", uvm_component parent);
    super.new(name, parent);
    item_got_port = new("item_got_port", this);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    item_got = fifo_sequence_item::type_id::create("item_got");
    if(!uvm_config_db#(virtual fifo_interface)::get(this, "", "vif", vif))
      `uvm_fatal("Monitor: ", "No vif is found!")
  endfunction
      
  virtual task run_phase(uvm_phase phase);
    forever begin
      @(posedge vif.monitor_mp.clk)
      if(vif.monitor_mp.monitor_cb.i_wren == 1)begin
        $display("\n Write is high");
        item_got.i_wren = vif.monitor_mp.monitor_cb.i_wren;
        item_got.i_wren = 'b1;
        item_got.i_rden = 'b0;
        //item_got.full = vif.monitor_mp.monitor_cb.full;
        item_got_port.write(item_got);
      end
      else if(vif.monitor_mp.monitor_cb.i_rden == 1)begin
        @(posedge vif.monitor_mp.clk)
        $display("\n Read is high");
        item_got.i_rddata = vif.monitor_mp.monitor_cb.i_rddata;
        item_got.i_rden = 'b1;
        item_got.i_wren = 'b0;
        //item_got.empty = vif.m_mp.m_cb.empty;
        //item_got_port.write(item_got);
      end
    end
  endtask
endclass

    
