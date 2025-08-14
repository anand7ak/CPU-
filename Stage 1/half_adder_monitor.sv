
class half_adder_monitor extends uvm_monitor;
    virtual half_adder_if vif;
    uvm_analysis_port #(half_adder_transaction) ap;

    `uvm_component_utils(half_adder_monitor)

    function new(string name, uvm_component parent);
        super.new(name, parent);
        ap = new("ap", this);
    endfunction

    function void build_phase(uvm_phase phase);
        if (!uvm_config_db#(virtual half_adder_if)::get(this, "", "vif", vif))
            `uvm_fatal("MON", "Virtual interface not set")
    endfunction

    task run_phase(uvm_phase phase);
        half_adder_transaction tr;
        forever begin
            #5;
            tr = half_adder_transaction::type_id::create("tr");
            tr.a = vif.a;
            tr.b = vif.b;
            tr.sum = vif.sum;
            tr.carry = vif.carry;
            ap.write(tr);
        end
    endtask
endclass
