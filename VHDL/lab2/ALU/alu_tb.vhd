LIBRARY ieee;
USE ieee.numeric_bit.ALL;
USE WORK.pack_a.ALL;
USE std.textio.ALL;

entity alu_tb is 
end entity alu_tb;

architecture secondtest of alu_tb is
component alu IS
   PORT( op: IN op_type;
         a, b : IN signed (3 DOWNTO 0);
         c : OUT signed (3 DOWNTO 0)); 
end component;

signal op_tb: op_type;
signal a_tb, b_tb, c_tb : signed (3 DOWNTO 0);
begin
  
  DUT: alu port map(op_tb, a_tb, b_tb, c_tb);
 p1:process 
    FILE test_f: text OPEN READ_MODE IS "test_input.txt";
	FILE results_f: text OPEN WRITE_MODE IS "alu_test_results.txt";
    VARIABLE L: line; 
    VARIABLE res_l: line;	
    VARIABLE op_var: bit_vector (1 DOWNTO 0);
    VARIABLE a_var, b_var, c_expected: signed (3 DOWNTO 0);
    VARIABLE c: character;
    VARIABLE pause: time;  
	   VARIABLE message: string (1 TO 14);
 begin
    WHILE NOT endfile(test_f) LOOP
    READLINE (test_f, L);
    READ (L, op_var);
    READ (L, a_var);
    READ (L, b_var);
    READ (L, pause);
    READ (L, c_expected);
    READ (L, message);
	
  CASE op_var IS
      when "00"  => op_tb <= add;
      when "01"  => op_tb <= sub;
      when "10"  => op_tb <= mul;
      when "11"  => op_tb <= div;
      when others =>  op_tb <= add; 
    END CASE; 
    a_tb <= a_var;
    b_tb <= b_var;
    wait for pause;
    
	WRITE (res_l, string'(". a = ")); 			
	  WRITE (res_l, a_tb);
	  
	  WRITE (res_l, string'(", b = ")); 
	  WRITE (res_l, b_tb);
	  
	  WRITE (res_l, string'(", Expected c = ")); 
	  WRITE (res_l, c_expected);
	  
	  WRITE (res_l, string'(", Actual c = ")); 
	  WRITE (res_l, c_tb);
	  
	  IF c_tb /= c_expected THEN
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
  
