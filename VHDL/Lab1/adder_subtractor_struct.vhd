library IEEE;
LIBRARY std;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_bit.ALL;
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_signed.all;


entity FULLADDER  is
  port( x,y,cin: IN std_logic;
	s,cout: OUT std_logic);
end FULLADDER;

architecture behavioral of FULLADDER is 
begin 
        S<=x XOR y XOR cin;
	cout<= (x AND (y OR cin)) OR (cin AND y);
end behavioral;

library IEEE;
LIBRARY std;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_bit.ALL;
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_signed.all;

entity adder_subtractor IS 
  port( A: IN std_logic_vector(3 downto 0);
	B: IN std_logic_vector(3 downto 0);
	M: IN STD_LOGIC;
	S: OUT std_logic_vector(3 downto 0);
	Cout: OUT STD_LOGIC);
end adder_subtractor;


architecture structural of adder_subtractor is 
  component FULLADDER 
	port( x,y,cin: in std_logic;
	      s,cout:out std_logic);
  end component;
  signal C0,C1,C2,C3:std_logic;
  signal b0,b1,b2,b3:std_logic;
  begin 
   b0<= M XOR B(0);
   b1<= M XOR B(1);
   b2<= M XOR B(2);
   b3<= M XOR B(3);
    FA0 :FULLADDER port map(A(0),b0,M,S(0),C0);
    FA1 :FULLADDER port map(A(1),b1,C0,S(1),C1);
    FA2 :FULLADDER port map(A(2),b2,C1,S(2),C2);
    FA3 :FULLADDER port map(A(3),b3,C2,S(3),C3);
    Cout <= C3 xor M;

  end structural;
 
