
`include "uvm_macros.svh"
`include "test_pkg.sv"

module top_tb;
    logic clk;
    half_adder_if intf();

    half_adder dut (
        .a(intf.a),
        .b(intf.b),
        .sum(intf.sum),
        .carry(intf.carry)
    );

    initial clk = 0;
    always #5 clk = ~clk;
    assign intf.clk = clk;

    initial begin
        uvm_config_db#(virtual half_adder_if)::set(null, "*", "vif", intf);
        run_test("half_adder_test");
    end
endmodule
