module brown#(
    parameter ADDRESS_WIDTH = 5,
    parameter DATA_WIDTH = 32
) (
    input logic clk,
    input logic ALUsrc,
    input logic [2:0] ALUctrl,
    input logic RegWrite,
    input logic [ADDRESS_WIDTH-1:0] rs1,
    input logic [ADDRESS_WIDTH-1:0] rs2,
    input logic [ADDRESS_WIDTH-1:0] rd,
    output logic [DATA_WIDTH-1:0] ALUout,   
    output logic [DATA_WIDTH-1:0] a0,
    output logic EQ
);

logic [DATA_WIDTH-1:0] ALUop1;
logic [DATA_WIDTH-1:0] ALUop2;
logic [DATA_WIDTH-1:0] regOp2;
logic [DATA_WIDTH-1:0] ImmOp = 32'b1;

regfile register_file(
    .clk(clk),
    .AD1(rs1),
    .AD2(rs2),
    .AD3(rd),
    .WE3(RegWrite),
    .WD3(ALUout),
    .RD1(ALUop1),
    .RD2(regOp2),
    .a0(a0)
);

alu ALU(
    .ALUop1(ALUop1),
    .ALUop2(ALUop2),
    .ALUctrl(ALUctrl),
    .ALUout(ALUout),
    .EQ(EQ)
);

mux MUX(
    .in0(regOp2),
    .in1(ImmOp),
    .sel(ALUsrc),
    .output(ALUop2)
);

endmodule
