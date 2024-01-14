
module RISCV_ITI (
	input clk,areset
);

    reg [31:0]SrcB,Result;
    wire [31:0]SrcA,ALUResult;
	wire [2:0]ALUControl;
    wire zero,sign,PCSrc,load,RegWrite,WE,ALUSrc,ResultSrc;
	wire[31:0]ImmExt,PC,Instr,WD,RD;
	wire[1:0]ImmSrc;



 Instruction_Memory InstrMem1(PC,Instr);
 
 Sign_extend Sign1(ImmSrc,Instr[31:7],ImmExt);

 ALU alu1(SrcA,SrcB,ALUControl,ALUResult,zero,sign);

 Program_Counter pc1(clk,load,areset,PCSrc,ImmExt,PC);

 Data_Memory DataMemory1(ALUResult,WD,WE,clk,RD);
 
 Control_Unit CU1(zero,sign,Instr,load,PCSrc,ALUSrc,ResultSrc,WE,RegWrite,ALUControl,ImmSrc);

 Register_File RF1(Instr[19:15],Instr[24:20],Instr[11:7],Result,RegWrite,clk,SrcA,WD);

 always @(*) begin
    if(ALUSrc==0)
    SrcB=WD; 
    else
    SrcB=ImmExt;

 end
 always @(*) begin
    if(ResultSrc==1)
    Result=RD;
    else
    Result=ALUResult;
 end

endmodule