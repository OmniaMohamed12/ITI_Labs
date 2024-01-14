module tb_truth_table();
reg [0:2]s;
reg e;
wire d0,d1,d2,d3,d4,d5,d6,d7;
truth_table m1(s,e,d0,d1,d2,d3,d4,d5,d6,d7);
initial begin
 $monitor("s=%b,e=%b,d0=%b,d1=%b,d2=%b,d3=%b,d4=%b,d5=%b,d6=%b,d7=%b",s,e,d0,d1,d2,d3,d4,d5,d6,d7);
 
e=0;

#20;
e=1;
s=3'b000;
#20;
s=3'b001;
#20;
s=3'b010;
#20;
s=3'b011;
#20;
s=3'b100;
#20;
s=3'b101;
#20;
s=3'b110;
#20;
s=3'b111;


end
endmodule

