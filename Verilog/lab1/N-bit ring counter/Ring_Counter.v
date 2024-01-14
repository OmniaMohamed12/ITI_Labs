module D_FF_clr (output reg q,input  clk,clr, d);
always @(posedge clk or negedge clr)
  if (~clr)
    q<= 1'b0;
  else
    q <= d;

endmodule
module D_FF_pr (output reg q,input  clk,pr, d);
always @(posedge clk or negedge pr)
  if (~pr)
    q<= 1'b1;
  else
    q <= d;

endmodule
module Ring_Counter#(parameter N = 4)(
  input  clk,rst,output  [N-1:0] q_out );

wire q1;
wire [N-1:0] d,q;

generate
  genvar i;
  for (i = 0; i < N; i = i + 1) begin 
    if (i == 0) begin
      D_FF_pr u1(q[0],clk,rst,q1);
    end 
    else begin 
	D_FF_clr u2(q[i],clk,rst,q[i-1]);
    end
  end
endgenerate
assign q1 = q[N-1];
assign q_out = q;

endmodule
