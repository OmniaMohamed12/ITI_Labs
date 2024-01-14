
module piso(input clk,load,[3:0] data_in,output reg data_out);

reg [3:0] temp;
always @(posedge clk) begin
if (load) temp<=data_in; 
else begin
data_out<=temp[3];
temp <= {temp[2:0],1'b0};
end
end
endmodule

