

library IEEE;
LIBRARY std;
USE ieee.numeric_std.ALL;
--USE ieee.numeric_bit.ALL;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.std_logic_arith.all;
--use IEEE.numeric_std.all;
--use IEEE.std_logic_signed.all;
USE std.textio.ALL;


entity comparator_tb is 
end entity comparator_tb;

architecture test of comparator_tb is

component comparator IS
   Port( a : IN  std_logic_vector (7 DOWNTO 0);
         b: IN std_logic_vector (7 DOWNTO 0);
         equal_out : OUT std_logic;
         not_equal_out: OUT std_logic);
END component comparator;

signal a_tb,b_tb:std_logic_vector (7 DOWNTO 0);
signal equal_out_tb, not_equal_out_tb:std_logic ;
begin
  
  DUT: comparator port map(a_tb, b_tb, equal_out_tb, not_equal_out_tb);
 p1:process 
    FILE test_f: text OPEN READ_MODE IS "test_comparator.txt";
	FILE results_f: text OPEN WRITE_MODE IS "comparator_test_results.txt";
    VARIABLE L: line; 
    VARIABLE res_l: line;	
    VARIABLE equal_out_var,not_equal_out_var: std_logic;
    VARIABLE a_var, b_var:std_logic_vector (7 DOWNTO 0);
  VARIABLE c: character;
    VARIABLE pause: time;  
	VARIABLE message: string (1 TO 22);
 begin
    WHILE NOT endfile(test_f) LOOP
    READLINE (test_f, L);
    READ (L, a_var);
    READ (L,b_var);
	READ (L, pause);
    READ (L, equal_out_var);
	READ (L, not_equal_out_var);
    READ (L, message);
	
  
    a_tb <= a_var;
    b_tb <= b_var;
	
    wait for pause;
    
	WRITE (res_l, string'(". a = ")); 			
	  WRITE (res_l, a_tb);
	  
	  WRITE (res_l, string'(", b = ")); 
	  WRITE (res_l, b_tb);
	  
	  WRITE (res_l, string'(", Expected equal_out = ")); 
	  WRITE (res_l, equal_out_var);
	  
	  WRITE (res_l, string'(", Expected not_equal_out = ")); 
	  WRITE (res_l, not_equal_out_var);
	  
	  WRITE (res_l, string'(", Actual equal_out = ")); 
	  WRITE (res_l, equal_out_tb);
	  
	  WRITE (res_l, string'(", Actual not_equal_out = ")); 
	  WRITE (res_l, not_equal_out_tb);
	  
	  IF equal_out_tb /= equal_out_var or  not_equal_out_tb /= not_equal_out_var THEN
          WRITE (res_l, string'(". Test failed! Error message:"));
          WRITE (res_l, message);
	  ELSE
          WRITE (res_l, string'(". Test passed."));
	  END IF;
	
	  WRITELINE (results_f, res_l); 



  end loop;
  wait;

  
 end process p1;

end architecture test;
  

