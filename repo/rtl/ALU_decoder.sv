module ALU_decoder (
    input logic [1:0] ALUOp,
    input logic [2:0] funct3,
    output logic [2:0] ALUControl
);

    assign ALUControl = {0'b0, ALUOp};

endmodule
