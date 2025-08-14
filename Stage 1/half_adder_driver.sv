
class half_adder_driver extends uvm_driver #(half_adder_transaction);
    virtual half_adder_if vif;

    `uvm_component_utils(half_adder_driver)

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual half_adder_if)::get(this, "", "vif", vif))
            `uvm_fatal("DRV", "Virtual interface not set")
    endfunction

    task run_phase(uvm_phase phase);
        half_adder_transaction tr;
        forever begin
            seq_item_port.get_next_item(tr);
            vif.a = tr.a;
            vif.b = tr.b;
            #5;
            seq_item_port.item_done();
        end
    endtask
endclass
