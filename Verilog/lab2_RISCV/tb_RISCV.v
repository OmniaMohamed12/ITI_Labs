`timescale 1 ns/10 ps
module tb_RISCV();

reg clk,areset;
integer i;

RISCV_ITI riscv(.clk(clk),.areset(areset));

always
begin
#10; clk=~clk;
end


initial
begin
for(i=0;i<21;i=i+1)
	$display("%h",riscv.InstrMem1.instr_mem[i]);
clk=0;
areset=0;
#5;
areset=1;
#3000;

$stop;
end
endmodule
