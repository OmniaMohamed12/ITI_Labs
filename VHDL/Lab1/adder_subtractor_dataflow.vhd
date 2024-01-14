library IEEE;
LIBRARY std;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_bit.ALL;
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_signed.all;

entity adder_subtractor  is
  port( A: IN std_logic_vector(3 downto 0);
	B: IN std_logic_vector(3 downto 0);
	M: IN STD_LOGIC;
	S: OUT std_logic_vector(3 downto 0);
	Cout: OUT STD_LOGIC);
END adder_subtractor;

architecture dataflow of adder_subtractor is 
  signal temp:STD_LOGIC_VECTOR(4 DOWNTO 0);
begin 
  temp<=('0' & A)+('0' & B) when M='0' else ('0' & A)-('0' & B);
  S<=temp(3 downto 0);
  Cout<= temp(4);
 
end dataflow;

