class fifo_sequence extends uvm_sequence #(fifo_sequence_items);
  `uvm_object_utils(fifo_sequence)
  
  function new(string name = "fifo_sequence");
    super.new(name);
  endfunction

  virtual task body();
    `uvm_info(get_type_name(), $sformatf("** Generate 1024 Write transactions**"), UVM_LOW)
    repeat(1024)
      
      
    
