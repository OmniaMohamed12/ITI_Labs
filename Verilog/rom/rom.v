module rom #(parameter size=8,parameter filename="rom.txt")
(input clk,rst,[2:0]address,output reg[size-1:0] data);
reg [7:0] rom[0:size-1];
always@(posedge clk or posedge rst) begin
if(rst) begin
$readmemh(filename,rom);
data<='b0;
end
else data<=rom[address];
end
endmodule
