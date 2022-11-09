library ieee;
use ieee.std_logic_1164.all;

entity test_bench is
end entity test_bench;

architecture test of test_bench is
signal clk_in : std_logic;
signal DL1_out : std_logic;
signal nrst_in : std_logic;
begin

constant clock_period := 1 ns;
clock_process: process
begin
<clock> <='0';
wait for clock_period/2;
<clock> <='1';
wait for clock_period/2;
end process;



dut: entity work.ticker port map (
	      clk=> clk_in,
	      DL1 => DL1_out,
			nrst => nrst_in
	    );
	 clk_in <= '0', '1' after 20 ns, '0' after 40 ns, '1' after 60 ns;
    

end architecture test;