module regfile #(
    DATA_WIDTH = 32,
    ADDR_WIDTH = 5
) (
    input logic                     clk,
    input logic [ADDR_WIDTH-1:0]    AD1,
    input logic [ADDR_WIDTH-1:0]    AD2,
    input logic [ADDR_WIDTH-1:0]    AD3,
    input logic                     WE3,
    input logic [DATA_WIDTH-1:0]    WD3,
    output logic [DATA_WIDTH-1:0]   RD1,
    output logic [DATA_WIDTH-1:0]   RD2,
    output logic [DATA_WIDTH-1:0]   a0
);

logic [DATA_WIDTH-1:0] registerfile [2**ADDR_WIDTH-1:0];

always_ff @(posedge clk) begin

    if(WE3) registerfile[AD3] <= WD3; 
    
end

always_comb begin
    RD1 <= registerfile[AD1];
    RD2 <= registerfile[AD2];
    a0 <= registerfile[5'd10];
end

endmodule
