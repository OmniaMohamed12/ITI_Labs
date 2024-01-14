module Data_Memory(input [31:0]A,input [31:0]WD,input WE,input clk,output reg [31:0]RD) ;
reg [31:0]data_memory[0:63];
always@(posedge clk) begin 
if (WE) begin
    data_memory[A[31:2]]<=WD;
end
end
always@(*)begin
 RD=data_memory[A];
 end

endmodule
