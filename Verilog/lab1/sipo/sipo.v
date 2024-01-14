
module sipo(input clk,rst,data_in,output [3:0] data_out);
reg[3:0]temp;
always@(posedge clk)begin
if(rst) temp<=4'b0000;
else begin
 temp<={temp[2:0],data_in};
end
end
assign data_out=temp;


endmodule

