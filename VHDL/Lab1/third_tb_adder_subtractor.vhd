library IEEE;
LIBRARY std;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_bit.ALL;
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_signed.all;

entity third_tb_adder_subtractor IS 
end third_tb_adder_subtractor;

architecture thirdtest of third_tb_adder_subtractor IS 
 component adder_subtractor 
  port(A: IN std_logic_vector(3 downto 0);
	B: IN std_logic_vector(3 downto 0);
	M: IN STD_LOGIC;
	S: OUT std_logic_vector(3 downto 0);
	Cout: OUT STD_LOGIC);
  end component;

for add_sub_behav: adder_subtractor USE ENTITY work.adder_subtractor(behavioral);
for add_sub_struct: adder_subtractor USE ENTITY work.adder_subtractor(structural);
for add_sub_dataflow: adder_subtractor USE ENTITY work.adder_subtractor(dataflow);

--inputs
	signal A,B: std_logic_vector(3 downto 0):="0000";
	signal M: std_logic:='0';
--outputs
        signal S_behav,S_struct,S_df: std_logic_vector(3 downto 0);
	signal Cout_behav,Cout_struct,Cout_df: std_logic;

 begin 
  add_sub_behav:adder_subtractor port map(A,B,M,S_behav,Cout_behav);
  add_sub_struct:adder_subtractor port map(A,B,M,S_struct,Cout_struct);
  add_sub_dataflow:adder_subtractor port map(A,B,M,S_df,Cout_df);
   process 
   begin
-- compare the outputs of  behavioral architecture and structural architecture 
   A<="1111";
   B<="0000";
   M<='1';
   wait for 20 ns;
   assert S_behav=S_struct report" FAILED: A=1111,B=0000,M=1 (the output (sum) of the behavioral architecture and structural architecture is not the same ) " severity error;
   assert Cout_behav=Cout_struct report" FAILED: A=1111,B=0000,M=1(the output (carry out) of the behavioral architecture and structural architecture is not the same) " severity error;
   report" PASSED: A=1111,B=0000,M=1 ===>(the outputs (sum, carry out) of the behavioral architecture and structural architecture are the same ";

   A<="1110";
   B<="1100";
   M<='0';
   wait for 20 ns;
   assert S_behav=S_struct report" FAILED: A=1110,B=1100,M=0 (the output (sum) of the behavioral architecture and structural architecture is not the same) " severity error;
   assert Cout_behav=Cout_struct report" FAILED: A=1110,B=1100,M=0(the output (carry out) of the behavioral architecture and structural architecture is not the same ) " severity error;
   report" passed: A=1110,B=1100,M=0 ===> (the outputs (sum, carry out) of the behavioral architecture and structural architecture are the same ) ";

   A<="1111";
   B<="1011";
   M<='1';
   wait for 20 ns;
   assert S_behav=S_struct report" FAILED: A=1111,B=1011,M=1 (the output (sum) of the behavioral architecture and structural architecture is not the same)" severity error;
   assert Cout_behav=Cout_struct report" FAILED: A=1111,B=1011,M=1(the output (carry out) of the behavioral architecture and structural architecture is not the same)" severity error;
   report" passed: A=1111,B=1011,M=1 ===> sum=0100 ,cout=0 the outputs (sum, carry out) of the behavioral architecture and structural architecture are the same";

   A<="0000";
   B<="1111";
   M<='0';
   wait for 20 ns;
   assert S_behav=S_struct report" FAILED: A=0000,B=1111,M=0 (the output (sum) of the behavioral architecture and structural architecture is not the same)" severity error;
   assert Cout_behav=Cout_struct report" FAILED: A=0000,B=1111,M=0(the output (carry out) of the behavioral architecture and structural architecture is not the same)" severity error;
   report" passed: A=0000,B=1111,M=0 ===> sum=1111 ,cout=0 the outputs (sum, carry out) of the behavioral architecture and structural architecture are the same";

   A<="1001";
   B<="1111";
   M<='0';
   wait for 20 ns;
   assert S_behav=S_struct report" FAILED: A=1001,B=1000,M=0 (the output (sum) of the behavioral architecture and structural architecture is not the same)" severity error;
   assert Cout_behav=Cout_struct report" FAILED: A=1001,B=1000,M=0(the output (carry out) of the behavioral architecture and structural architecture is not the same)" severity error;
   report" passed: A=1001,B=1111,M=0 ===> sum=1000 ,cout=1 the outputs (sum, carry out) of the behavioral architecture and structural architecture are the same";
   
-- compare the outputs of  behavioral architecture and dataflow architecture
   A<="1111";
   B<="0000";
   M<='1';
   wait for 20 ns;
   assert S_behav=S_df report" FAILED: A=1111,B=0000,M=1 (the output (sum) of the behavioral architecture and dataflow architecture is not the same ) " severity error;
   assert Cout_behav=Cout_df report" FAILED: A=1111,B=0000,M=1(the output (carry out) of the behavioral architecture and dataflow architecture is not the same) " severity error;
   report" PASSED: A=1111,B=0000,M=1 ===>(the outputs (sum, carry out) of the behavioral architecture and dataflow architecture are the same ";

   A<="1110";
   B<="1100";
   M<='0';
   wait for 20 ns;
   assert S_behav=S_df report" FAILED: A=1110,B=1100,M=0 (the output (sum) of the behavioral architecture and dataflow architecture is not the same) " severity error;
   assert Cout_behav=Cout_df report" FAILED: A=1110,B=1100,M=0(the output (carry out) of the behavioral architecture and dataflow architecture is not the same ) " severity error;
   report" passed: A=1110,B=1100,M=0 ===> (the outputs (sum, carry out) of the behavioral architecture and dataflow architecture are the same ) ";

   A<="1111";
   B<="1011";
   M<='1';
   wait for 20 ns;
   assert S_behav=S_df report" FAILED: A=1111,B=1011,M=1 (the output (sum) of the behavioral architecture and dataflow architecture is not the same)" severity error;
   assert Cout_behav=Cout_df report" FAILED: A=1111,B=1011,M=1(the output (carry out) of the behavioral architecture and dataflow architecture is not the same)" severity error;
   report" passed: A=1111,B=1011,M=1 ===> sum=0100 ,cout=0 the outputs (sum, carry out) of the behavioral architecture and dataflow architecture are the same";

   A<="0000";
   B<="1111";
   M<='0';
   wait for 20 ns;
   assert S_behav=S_df report" FAILED: A=0000,B=1111,M=0 (the output (sum) of the behavioral architecture and dataflow architecture is not the same)" severity error;
   assert Cout_behav=Cout_df report" FAILED: A=0000,B=1111,M=0(the output (carry out) of the behavioral architecture and dataflow architecture is not the same)" severity error;
   report" passed: A=0000,B=1111,M=0 ===> sum=1111 ,cout=0 the outputs (sum, carry out) of the behavioral architecture and dataflow architecture are the same";

   A<="1001";
   B<="1111";
   M<='0';
   wait for 20 ns;
   assert S_behav=S_df report" FAILED: A=1001,B=1000,M=0 (the output (sum) of the behavioral architecture and dataflow architecture is not the same)" severity error;
   assert Cout_behav=Cout_df report" FAILED: A=1001,B=1000,M=0(the output (carry out) of the behavioral architecture and dataflow architecture is not the same)" severity error;
   report" passed: A=1001,B=1111,M=0 ===> sum=1000 ,cout=1 the outputs (sum, carry out) of the behavioral architecture and dataflow architecture are the same";
    

-- compare the outputs of  dataflow architecture and structural architecture 
   A<="1111";
   B<="0000";
   M<='1';
   wait for 20 ns;
   assert S_df=S_struct report" FAILED: A=1111,B=0000,M=1 (the output (sum) of the dataflow architecture and structural architecture is not the same ) " severity error;
   assert Cout_df=Cout_struct report" FAILED: A=1111,B=0000,M=1(the output (carry out) of the dataflow architecture and structural architecture is not the same) " severity error;
   report" PASSED: A=1111,B=0000,M=1 ===>(the outputs (sum, carry out) of the dataflow architecture and structural architecture are the same ";

   A<="1110";
   B<="1100";
   M<='0';
   wait for 20 ns;
   assert S_df=S_struct report" FAILED: A=1110,B=1100,M=0 (the output (sum) of the dataflow architecture and structural architecture is not the same) " severity error;
   assert Cout_df=Cout_struct report" FAILED: A=1110,B=1100,M=0(the output (carry out) of the dataflow architecture and structural architecture is not the same ) " severity error;
   report" passed: A=1110,B=1100,M=0 ===> (the outputs (sum, carry out) of the dataflow architecture and structural architecture are the same ) ";

   A<="1111";
   B<="1011";
   M<='1';
   wait for 20 ns;
   assert S_df=S_struct report" FAILED: A=1111,B=1011,M=1 (the output (sum) of the dataflow architecture and structural architecture is not the same)" severity error;
   assert Cout_df=Cout_struct report" FAILED: A=1111,B=1011,M=1(the output (carry out) of the dataflow architecture and structural architecture is not the same)" severity error;
   report" passed: A=1111,B=1011,M=1 ===> sum=0100 ,cout=0 the outputs (sum, carry out) of the dataflow architecture and structural architecture are the same";

   A<="0000";
   B<="1111";
   M<='0';
   wait for 20 ns;
   assert S_df=S_struct report" FAILED: A=0000,B=1111,M=0 (the output (sum) of the dataflow architecture and structural architecture is not the same)" severity error;
   assert Cout_df=Cout_struct report" FAILED: A=0000,B=1111,M=0(the output (carry out) of the dataflow architecture and structural architecture is not the same)" severity error;
   report" passed: A=0000,B=1111,M=0 ===> sum=1111 ,cout=0 the outputs (sum, carry out) of the dataflow architecture and structural architecture are the same";

   A<="1001";
   B<="1111";
   M<='0';
   wait for 20 ns;
   assert S_df=S_struct report" FAILED: A=1001,B=1000,M=0 (the output (sum) of the dataflow architecture and structural architecture is not the same)" severity error;
   assert Cout_df=Cout_struct report" FAILED: A=1001,B=1000,M=0(the output (carry out) of the dataflow architecture and structural architecture is not the same)" severity error;
   report" passed: A=1001,B=1111,M=0 ===> sum=1000 ,cout=1 the outputs (sum, carry out) of the dataflow architecture and structural architecture are the same";
   
   wait;
   end process;
   end thirdtest;





