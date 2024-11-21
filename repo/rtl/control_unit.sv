module control_unit #(
    parameter INS_WIDTH = 32,
    parameter OPCODE_LENGTH = 7
    )(
    input logic [INS_WIDTH-1:0] INSTRUCTION,
    input logic EQ,
    output logic PC_src,
    output logic [2:0] ALU_control,
    output logic ALU_src,
    output logic [1:0] imm_src,
    output logic reg_write
    );

    wire [1:0] ALU_op;

    main_decoder # (OPCODE_LENGTH) main_decoder(
        .opcode(INSTRUCTION[OPCODE_LENGTH-1:0]),
        .PCSrc(PC_src),
        .ALUSrc(ALU_src),
        .ImmSRC(imm_src),
        .RegWrite(reg_write),
        .ALUOp(ALU_op)
    );

    ALU_decoder ALU_decoder(
        .ALUOp(ALU_op),
        .funct3(INSTRUCTION[14:12]),
        .ALUControl(ALU_control)
    );

endmodule
