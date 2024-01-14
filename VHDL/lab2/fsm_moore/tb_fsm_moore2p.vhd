library ieee;
use ieee.std_logic_1164.all;

entity fsm_moore2p_tb is 
end entity fsm_moore2p_tb;

architecture test of fsm_moore2p_tb is
 component fsm IS
  PORT( clk, reset: IN std_logic;
        x: IN std_logic;
        y: OUT std_logic);
 END component fsm;
 
 for dut: fsm use entity work.fsm(moore_2p);
 signal CLK,RESET,X,Y: std_logic;
 begin 
 dut:fsm port map (CLK,RESET,X,Y);
 clock_process: process is
  begin 
  clk<='0' ,'1' after 15 ns;
  wait for 30 ns;
 end process clock_process;

 check:process is
  begin

  RESET<='1';
  wait for 15 ns;
  assert Y='0' REPORT"FAILED: RESET " severity error;
  REPORT"PASSED:RESET";

  RESET<='0';
  X<='0';
  wait for 15 ns;
  assert Y='0' REPORT"FAILED: even state , x=0 " severity error;
  REPORT"PASSED:even state , x=0";

  X<='0';
  --wait for 15 ns;
  assert Y='0' REPORT"FAILED: even state :output does not change without clock " severity error;
  REPORT"PASSED:even state :output doesnot change without clock ";
 
 
  
  wait for 15 ns;
  X<='1';
  wait for 15 ns;
  assert Y='0' REPORT"FAILED: even state , x=1 " severity error;
  REPORT"PASSED:even state , x=1";

  wait for 15 ns;
  X<='0';
  wait for 15 ns;
  assert Y='1' REPORT"FAILED: odd state , x=0 " severity error;
  REPORT"PASSED:odd state , x=0";

  X<='0';
  --wait for 15 ns;
  assert Y='1' REPORT"FAILED: odd state :output does not change without clock " severity error;
  REPORT"PASSED:odd state :output doesnot change without clock ";

  wait for 15 ns;
  X<='1';
  wait for 15 ns;
  assert Y='1' REPORT"FAILED: odd state , x=1 " severity error;
  REPORT"PASSED:odd state , x=1";

 wait;
 end process check;
 end architecture test;


  




