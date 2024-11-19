module sign_extend (
        input logic [31:0] instruction,
        output logic [31:0] imm
);
    always_comb begin
        imm = {{20{instruction[31]}}, instruction[31:20]};
    end
        
    
endmodule