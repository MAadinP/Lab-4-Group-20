module alu #(
    DATA_WIDTH = 32,
) (
    input logic [DATA_WIDTH-1:0]            ALUop1,
    input logic [DATA_WIDTH-1:0]            ALUop2,
    input logic [DATA_WIDTH-1:0]            ALUctrl,
    output logic [DATA_WIDTH-1:0]           ALUout,
    output logic [DATA_WIDTH-1:0]           EQ //equality flag
);

always_comb begin  
    case (ALUctrl)  
        3'b000: ALUout <= ALUop1 + ALUop2; 
        default: ALUout <= {DATA_WIDTH{1'b0}};
    endcase
end

assign EQ = (ALUop1 == ALUop2);

endmodule
