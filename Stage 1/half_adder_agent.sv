
class half_adder_agent extends uvm_agent;
    half_adder_driver driver;
    half_adder_monitor monitor;
    uvm_sequencer #(half_adder_transaction) sequencer;

    `uvm_component_utils(half_adder_agent)

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        driver = half_adder_driver::type_id::create("driver", this);
        monitor = half_adder_monitor::type_id::create("monitor", this);
        sequencer = uvm_sequencer #(half_adder_transaction)::type_id::create("sequencer", this);
    endfunction

    function void connect_phase(uvm_phase phase);
        driver.seq_item_port.connect(sequencer.seq_item_export);
    endfunction
endclass
