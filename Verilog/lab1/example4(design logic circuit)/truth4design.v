module truth4design (input A,B,C,output OUT);
assign OUT=(A&B) | (C&B);

endmodule
