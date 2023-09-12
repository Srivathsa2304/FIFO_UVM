class fifo_driver extends uvm_driver #(fifo_sequence_items);
  virtual fifo_interface vif;
  fifo_sequence_items req;
  `uvm_component_utils(fifo_driver)

  function new(string name="fifo_driver", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  
