// CPU19 Testbench
module cpu19_tb;
    reg clk = 0;
    reg reset = 1;

    cpu19_core uut (
        .clk(clk),
        .reset(reset)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("cpu19_tb.vcd");
        $dumpvars(0, cpu19_tb);
        #20 reset = 0;
        #200 $finish;
    end
endmodule
