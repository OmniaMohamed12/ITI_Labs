library IEEE;
LIBRARY std;
use IEEE.STD_LOGIC_1164.ALL;
--USE ieee.numeric_bit.ALL;
--use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_signed.all;

entity decoder_tb IS 
end decoder_tb;

architecture firsttest of decoder_tb IS 
 component decoder  
  port(address: IN std_logic_vector(2 DOWNTO 0);
        decode: OUT std_logic_vector(7 DOWNTO 0));
  end component;
for dut: decoder  USE ENTITY work.decoder (behav);
--inputs
	signal address_1: std_logic_vector(2 downto 0);
--outputs
  signal decode_1: std_logic_vector(7 downto 0);

 begin 
   dut:decoder port map(address_1,decode_1);
   process 
   begin

  address_1 <="001";
   wait for 20 ns;
   assert decode_1=X"11" report" FAILED: address=001" severity error;
   report" PASSED: address=001,decode=11";

   address_1 <="111";
   wait for 20 ns;
   assert decode_1=X"42" report" FAILED: address=111" severity error;
   report" PASSED: address=111,decode=42";

   address_1 <="010";
   wait for 20 ns;
   assert decode_1=X"44" report" FAILED: address=010 " severity error;
   report" PASSED: address=010,decode=44";

   address_1<="101";
   wait for 20 ns;
   assert decode_1=X"88" report" FAILED: address=101 " severity error;
   report" PASSED: address=101,decode=88";

   address_1<="110";
   wait for 20 ns;
   assert decode_1=X"88" report" FAILED: address=110 " severity error;
   report" PASSED: address=110,decode=88";

   address_1 <="000";
   wait for 20 ns;
   assert decode_1=X"00" report" FAILED: address=000 " severity error;
   report" PASSED: address=000,decode=00";

   address_1 <="011";
   wait for 20 ns;
   assert decode_1=X"00" report" FAILED: address=011 " severity error;
   report" PASSED: address=011,decode=00";

   address_1 <="100";
   wait for 20 ns;
   assert decode_1=X"00" report" FAILED: address=100 " severity error;
   report" PASSED: address=100,decode=00";
 
   address_1 <="XXX";
   wait for 20 ns;
   assert decode_1=X"00" report" FAILED: address=XXX " severity error;
   report" PASSED: address=XXX,decode=00";
   
   address_1 <="UUU";
   wait for 20 ns;
   assert decode_1=X"00" report" FAILED: address=UUU" severity error;
   report" PASSED: address=UUU,decode=00";
   
   address_1 <="ZZZ";
   wait for 20 ns;
   assert decode_1=X"00" report" FAILED: address=ZZZ " severity error;
   report" PASSED: address=ZZZ,decode=00";
   
   address_1 <="---";
   wait for 20 ns;
   assert decode_1=X"00" report" FAILED: address=--- " severity error;
   report" PASSED: address=---,decode=00";
   
   address_1 <="WWW";
   wait for 20 ns;
   assert decode_1=X"00" report" FAILED: address=www " severity error;
   report" PASSED: address=www,decode=00";
   
   address_1 <="HHH";
   wait for 20 ns;
   assert decode_1=X"00" report" FAILED: address=HHH " severity error;
   report" PASSED: address=HHH,decode=00";
   
   address_1 <="LLL";
   wait for 20 ns;
   assert decode_1=X"00" report" FAILED: address=LLL " severity error;
   report" PASSED: address=LLL,decode=00";
   
   
   wait;
   end process;
   end firsttest;
