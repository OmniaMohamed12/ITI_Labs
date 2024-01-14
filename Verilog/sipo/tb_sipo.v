module tb_sipo();
reg clk,rst;
reg data_in;
wire[3:0] data_out;
sipo m1(clk,rst,data_in,data_out);
initial begin 
clk=1'b0;
forever#10 clk=~clk;
end
initial begin
 $monitor("data_in=%b,data_out=%b",data_in,data_out);
 end
 initial begin
 rst=1'b1;
data_in=1'b1;
#10 rst=1'b0;

#20;
data_in=1'b0;
#20;
data_in=1'b0;
#20;
data_in=1'b1;
#50;

end
endmodule
