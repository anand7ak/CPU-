
class half_adder_transaction extends uvm_sequence_item;
    rand bit a, b;
    bit sum, carry;

    `uvm_object_utils(half_adder_transaction)

    function new(string name = "half_adder_transaction");
        super.new(name);
    endfunction

    function void do_print(uvm_printer printer);
        super.do_print(printer);
        `uvm_info("TRANSACTION", $sformatf("a=%0b b=%0b sum=%0b carry=%0b", a, b, sum, carry), UVM_LOW)
    endfunction
endclass
