library ieee;
use ieee.std_logic_1164.all;

----------------------------------------

entity ticker is
    port( GCLK0 : in std_logic;
        DL1  : out std_logic;
        DL3  : out std_logic;
        tick : out std_logic
    );
end ticker;

----------------------------------------

architecture ticker of ticker is
    constant Period : integer   := 50_000_000;
    signal state    : std_logic := '0';
begin
    clock           : process (GCLK0)
        variable second : integer range 0 to Period;
    begin
        if rising_edge(GCLK0) then
            second := second + 1;
            if second = Period then
                second := 0;
                state  <= not state;
            end if;
        end if;
    end process clock;
    tick <= GCLK0;
    DL1  <= state;
    DL3  <= not state;
end ticker;

------------------------------------------
