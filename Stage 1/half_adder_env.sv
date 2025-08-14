
class half_adder_env extends uvm_env;
    half_adder_agent agent;
    half_adder_scoreboard scoreboard;

    `uvm_component_utils(half_adder_env)

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        agent = half_adder_agent::type_id::create("agent", this);
        scoreboard = half_adder_scoreboard::type_id::create("scoreboard", this);
    endfunction

    function void connect_phase(uvm_phase phase);
        agent.monitor.ap.connect(scoreboard.ap);
    endfunction
endclass
