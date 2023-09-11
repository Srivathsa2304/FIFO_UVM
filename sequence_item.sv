//SEQUENCE ITEM

class fifo_sequence_items extends sequence_item;
rand bit i_wren;
rand bit i_rden;
rand bit [127:0] i_wrdata;
bit o_full;
bit o_alm_full;
bit o_empty;
bit o_alm_empty;
bit [127:0] o_rddata;
`uvm_object_utils_begin(fifo_sequence_items)
  `uvm_field_int(i_wren, UVM_ALL_ON)
  `uvm_field_int(i_rden, UVM_ALL_ON)
  `uvm_field_int(i_wrdata, UVM_ALL_ON)
  `uvm_field_int(o_full, UVM_ALL_ON)
  `uvm_field_int(o_alm_full, UVM_ALL_ON)
  `uvm_field_int(o_empty, UVM_ALL_ON)
  `uvm_field_int(o_alm_empty, UVM_ALL_ON)
  `uvm_field_int(o_rddata, UVM_ALL_ON)
  `uvm_object_utils_end

constraint c1{soft i_wren!=i_rden;}
  
  // function void pre_randomize();
  //   if(i_rden)
  //     data_in.rand_mode(0);
  // endfunction

  function new(string name="fifo_sequence_items");
    super.new(name);
  endfunction

endclass
  
