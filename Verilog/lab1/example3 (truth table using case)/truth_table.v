module truth_table(input [0:2] s,input e,output reg d0,d1,d2,d3,d4,d5,d6,d7);

always@(*) begin
if(e) begin
case(s)
3'b000: {d0,d1,d2,d3,d4,d5,d6,d7}=8'b0000_0001;
3'b001: {d0,d1,d2,d3,d4,d5,d6,d7}=8'b0000_0010;
3'b010: {d0,d1,d2,d3,d4,d5,d6,d7}=8'b0000_0100;
3'b011: {d0,d1,d2,d3,d4,d5,d6,d7}=8'b0000_1000;
3'b100: {d0,d1,d2,d3,d4,d5,d6,d7}=8'b0001_0000;
3'b101: {d0,d1,d2,d3,d4,d5,d6,d7}=8'b0010_0000;
3'b110: {d0,d1,d2,d3,d4,d5,d6,d7}=8'b0100_0000;
3'b111: {d0,d1,d2,d3,d4,d5,d6,d7}=8'b1000_0000;
endcase
end
else begin
{d0,d1,d2,d3,d4,d5,d6,d7}=8'b0000_0000;
end

end
endmodule
