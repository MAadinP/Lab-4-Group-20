module alu #(
    DATA_WIDTH = 32,
)(
    input logic [DATA_WIDTH-1:0]            ALUop1,
    input logic [DATA_WIDTH-1:0]            ALUop2,
    input logic [DATA_WIDTH-1:0]            ALUctrl,
    output logic [DATA_WIDTH-1:0]           SUM,
    output logic [DATA_WIDTH-1:0]           EQ //equality flag
);

always_comb begin 
     
    
end