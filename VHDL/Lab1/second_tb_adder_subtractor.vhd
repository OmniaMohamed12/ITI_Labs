

library IEEE;
LIBRARY std;
USE ieee.numeric_std.ALL;
--USE ieee.numeric_bit.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
USE std.textio.ALL;


entity second_tb_adder_subtractor is 
end entity second_tb_adder_subtractor;

architecture secondtest of second_tb_adder_subtractor is

component adder_subtractor IS 
  port( A: IN std_logic_vector(3 downto 0);
	B: IN std_logic_vector(3 downto 0);
	M: IN STD_LOGIC;
	S: OUT std_logic_vector(3 downto 0);
	Cout: OUT STD_LOGIC);
end component adder_subtractor;
for dut: adder_subtractor USE ENTITY work.adder_subtractor(dataflow);
signal m_tb,cout_tb: STD_LOGIC;
signal a_tb, b_tb, s_tb : std_logic_vector(3 downto 0);
begin
  
  DUT: adder_subtractor port map(a_tb, b_tb,m_tb,s_tb, cout_tb);
 p1:process 
    FILE test_f: text OPEN READ_MODE IS "add_sub_test_input.txt";
	FILE results_f: text OPEN WRITE_MODE IS "add_sub_test_results.txt";
    VARIABLE L: line; 
    VARIABLE res_l: line;	
    VARIABLE m_var,cout_expected: STD_LOGIC;
    VARIABLE a_var, b_var, s_expected:std_logic_vector(3 downto 0);
    VARIABLE c: character;
    VARIABLE pause: time;  
	   VARIABLE message: string (1 TO 14);
 begin
    WHILE NOT endfile(test_f) LOOP
    READLINE (test_f, L);
    READ (L, a_var);
    READ (L, b_var);
 READ (L, m_var);
    READ (L, pause);
    READ (L, cout_expected);
 READ (L, s_expected);
    READ (L, message);
	

    a_tb <= a_var;
    b_tb <= b_var;
    m_tb<= m_var;
   
    wait for pause;
    
	WRITE (res_l, string'(". a = ")); 			
	  WRITE (res_l, a_tb);
	  
	  WRITE (res_l, string'(", b = ")); 
	  WRITE (res_l, b_tb);
	  
	  WRITE (res_l, string'(", m = ")); 
	  WRITE (res_l, m_tb);

	  WRITE (res_l, string'(", Expected cout = ")); 
	  WRITE (res_l, cout_expected);
	  
	  WRITE (res_l, string'(", Actual cout = ")); 
	  WRITE (res_l, cout_tb);
	
         WRITE (res_l, string'(", Expected sum = ")); 
	  WRITE (res_l, s_expected);
	  
	  WRITE (res_l, string'(", Actual sum = ")); 
	  WRITE (res_l, s_tb);  
	  IF cout_tb /= cout_expected or s_tb /= s_expected THEN
          WRITE (res_l, string'(". Test failed! Error message:"));
          WRITE (res_l, message);
	  ELSE
          WRITE (res_l, string'(". Test passed."));
	  END IF;
	
	  WRITELINE (results_f, res_l); 

  end loop;
  wait;
 end process p1;
end architecture secondtest;
  

