module sign_extend #(
    input logic [31:0] instr,       // Input instruction
    input logic immsrc,            // 1-bit control signal for immediate source
    output logic [31:0] imm_ext    // Extended immediate
);
    always_comb 
        if (immsrc) 
            imm_ext = {{20{instr[31]}}, instr[31:20]};  // (for I-type)
        else 
            imm_ext = {{20{instr[31]}}, instr[11:0]};   // (for S-type)
endmodule
