// `include "fifo_agent.sv"
// `include "fifo_scoreboard.sv"

class fifo_environment extends uvm_env;
  fifo_agent1 f_agt1;
  fifo_agent2 f_agt2;
  fifo_scoreboard f_scb;
  `uvm_component_utils(fifo_environment)
  
  function new(string name = "fifo_environment", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    f_agt1 = fifo_agent1::type_id::create("f_agt1", this);
    f_agt2 = fifo_agent2::type_id::create("f_agt2", this);
    f_scb = fifo_scoreboard::type_id::create("f_scb", this);
  endfunction
  
  virtual function void connect_phase(uvm_phase phase);
    f_agt1.fifo_monitor1.item_got_port1.connect(f_scb.item_got_export1);
    f_agt2.fifo_monitor2.item_got_port2.connect(f_scb.item_got_export2);
  endfunction
  
endclass
