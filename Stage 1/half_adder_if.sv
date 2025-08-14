
interface half_adder_if();
    logic a;
    logic b;
    logic sum;
    logic carry;

    clocking cb @(posedge clk);
        output a, b;
        input sum, carry;
    endclocking

    logic clk;
endinterface
