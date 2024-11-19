module sign_extend (
    /* verilator lint_off UNUSED */
    input logic [31:0] instr,       
    /* verilator lint_on UNUSED */
      // Input instruction
    output logic [31:0] imm_ext    // Extended immediate
);
    always_comb begin
        imm_ext = {{20{instr[31]}}, instr[31:20]}; // Sign extend 12-bit immediate
    end

endmodule
