module tb_truth4design();
reg A,B,C;
wire OUT;
truth4design m1(A,B,C,OUT);
initial begin
 $monitor("A=%b,B=%b,C=%b,OUT=%b",A,B,C,OUT);
 
A=0;B=0;C=0;

#20;
A=0;B=0;C=1;
#20;
A=0;B=1;C=0;
#20;
A=0;B=1;C=1;
#20;
A=1;B=0;C=0;
#20;
A=1;B=0;C=1;
#20;
A=1;B=1;C=0;
#20;
A=1;B=1;C=1;



end
endmodule
