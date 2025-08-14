
class half_adder_test extends uvm_test;
    half_adder_env env;

    `uvm_component_utils(half_adder_test)

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        env = half_adder_env::type_id::create("env", this);
    endfunction

    task run_phase(uvm_phase phase);
        half_adder_transaction seq;
        phase.raise_objection(this);

        repeat (4) begin
            seq = half_adder_transaction::type_id::create("seq");
            assert(seq.randomize());
            env.agent.sequencer.start_item(seq);
            env.agent.sequencer.finish_item(seq);
        end

        phase.drop_objection(this);
    endtask
endclass
