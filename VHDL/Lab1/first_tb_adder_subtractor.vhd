library IEEE;
LIBRARY std;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_bit.ALL;
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_signed.all;

entity adder_subtractor_tb IS 
end adder_subtractor_tb;

architecture firsttest of adder_subtractor_tb IS 
 component adder_subtractor 
  port(A: IN std_logic_vector(3 downto 0);
	B: IN std_logic_vector(3 downto 0);
	M: IN STD_LOGIC;
	S: OUT std_logic_vector(3 downto 0);
	Cout: OUT STD_LOGIC);
  end component;
for dut: adder_subtractor USE ENTITY work.adder_subtractor(dataflow);
--inputs
	signal A,B: std_logic_vector(3 downto 0):="0000";
	signal M: std_logic:='0';
--outputs
        signal S: std_logic_vector(3 downto 0);
	signal Cout: std_logic;

 begin 
   dut:adder_subtractor port map(A,B,M,S,Cout);
   process 
   begin

   A<="1111";
   B<="0000";
   M<='1';
   wait for 20 ns;
   assert S="1111" report" FAILED: A=1111,B=0000,M=1 (sum is incorrrect)" severity error;
   assert Cout='0' report" FAILED: A=1111,B=0000,M=1(carry out is incorrrect)" severity error;
   report" PASSED: A=1111,B=0000,M=1 ===> sum=1111,cout=0";

   A<="1110";
   B<="1100";
   M<='0';
   wait for 20 ns;
   assert S="1010" report" FAILED: A=1110,B=1100,M=0 (sum is incorrrect)" severity error;
   assert Cout='1' report" FAILED: A=1110,B=1100,M=0(carry out is incorrrect)" severity error;
   report" passed: A=1110,B=1100,M=0 ===> sum=1010 ,cout=1";

   A<="1111";
   B<="1011";
   M<='1';
   wait for 20 ns;
   assert S="0100" report" FAILED: A=1111,B=1011,M=1 (sum is incorrrect)" severity error;
   assert Cout='0' report" FAILED: A=1111,B=1011,M=1(carry out is incorrrect)" severity error;
   report" passed: A=1111,B=1011,M=1 ===> sum=0100 ,cout=0";

   A<="0000";
   B<="1111";
   M<='0';
   wait for 20 ns;
   assert S="1111" report" FAILED: A=0000,B=1111,M=0 (sum is incorrrect)" severity error;
   assert Cout='0' report" FAILED: A=0000,B=1111,M=0(carry out is incorrrect)" severity error;
   report" passed: A=0000,B=1111,M=0 ===> sum=1111 ,cout=0";

   A<="1001";
   B<="1111";
   M<='0';
   wait for 20 ns;
   assert S="1000" report" FAILED: A=1001,B=1000,M=0 (sum is incorrrect)" severity error;
   assert Cout='1' report" FAILED: A=1001,B=1000,M=0(carry out is incorrrect)" severity error;
   report" passed: A=1001,B=1111,M=0 ===> sum=1000 ,cout=1";

   end process;
   end firsttest;




