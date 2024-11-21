module main_decoder #(
    parameter opcode_length = 7
    )(
    input logic [opcode_length-1:0] opcode,
    output logic PCSrc,
    output logic ALUSrc,
    output logic [1:0] ImmSRC,
    output logic RegWrite,
    output logic [1:0] ALUOp
    );

    wire is_addi;

    assign is_addi = (opcode == 7'b0010011) ? 1'b1 : 1'b0;

    assign ALUSrc = is_addi;
    assign RegWrite = is_addi;
    assign PCSrc = ~is_addi;

    assign ImmSRC = (is_addi) ? 2'b00 : 2'b10;
    assign ALUOp = (is_addi) ? 2'b00 : 2'b01;
    

endmodule
