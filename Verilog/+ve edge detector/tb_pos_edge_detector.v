module tb_pos_edge_detector();
reg clk,sig;
wire pe;
pos_edge_detector m1(clk,sig,pe);
always #5 clk=~clk;
initial begin
clk=0;
sig=0;
#10; sig=1;
#10; sig=0;
#10; sig=1;


end
endmodule

