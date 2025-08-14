
class half_adder_scoreboard extends uvm_component;
    uvm_analysis_imp #(half_adder_transaction, half_adder_scoreboard) ap;

    `uvm_component_utils(half_adder_scoreboard)

    function new(string name, uvm_component parent);
        super.new(name, parent);
        ap = new("ap", this);
    endfunction

    function void write(half_adder_transaction tr);
        bit expected_sum = tr.a ^ tr.b;
        bit expected_carry = tr.a & tr.b;

        if (tr.sum !== expected_sum || tr.carry !== expected_carry) begin
            `uvm_error("SCOREBOARD", $sformatf("Mismatch! a=%0b b=%0b sum=%0b (exp=%0b), carry=%0b (exp=%0b)",
                        tr.a, tr.b, tr.sum, expected_sum, tr.carry, expected_carry))
        end else begin
            `uvm_info("SCOREBOARD", $sformatf("PASSED: a=%0b b=%0b sum=%0b carry=%0b",
                        tr.a, tr.b, tr.sum, tr.carry), UVM_LOW)
        end
    endfunction
endclass
