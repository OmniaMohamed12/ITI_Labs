library IEEE;
LIBRARY std;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_bit.ALL;
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_signed.all;

entity adder_subtractor  is
  port( A: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	B: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	M: IN STD_LOGIC;
	S: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	Cout: OUT STD_LOGIC);
END adder_subtractor;

architecture behavioral of adder_subtractor is 
begin 
   process(A,B,M) IS 
   VARIABLE temp:STD_LOGIC_VECTOR(4 DOWNTO 0);
   begin 
      if(M='0') then 
        temp:=('0' & A)+('0' & B);
        S<=temp(3 downto 0);
        Cout<= temp(4);
      else
	temp:=('0' & A)-('0' & B);
	S<=temp(3 downto 0);
        Cout<= temp(4);
       end if;
   end process;
end behavioral;
