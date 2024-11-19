module programme_counter #(
    parameter BITWIDTH = 32
)(
    input logic         clk,
    input logic         rst,
    input logic       pcsrc,
    input logic [width-1:0] immop,
    output logic    [WIDTH-1:0]   pc
);
    logic next_pc;
    logic branch_pc;
    logic inc_pc;

    assign branch_pc = pc + immop;
    assign inc_pc = pc + 4'b0100;
    assign next_pc = pcsrc ? branch_pc : inc_pc;
    

    always_ff @ (posedge clk)
        if (rst)
            pc <= {BITWIDTH{1'b0}};
        else
            pc <= next_pc; //what is value prior to first cycle
endmodule

