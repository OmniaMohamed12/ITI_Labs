module tb_piso();
reg clk,load;
reg [3:0] data_in;
wire data_out;
piso m1(clk,load,data_in,data_out);
always #10 clk=~clk;
initial begin
 clk=0;
 forever #5 clk=~clk;
end
initial begin
load=0;
data_in=4'b0000;
$monitor("time =%d load=%b,data_in=%b,data_out=%b",$time,load,data_in,data_out);
#20;
load=1;
data_in=4'b1001;
#20; load=0; 
#150; load=1;
data_in=4'b0101;
#20; load=0; 
#150; 

end
endmodule
