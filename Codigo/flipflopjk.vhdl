library ieee;
use ieee.std_logic_1164.all;

entity flipflopjk is
    port(
        clk   : in  std_logic := '0';
        j,k   : in  std_logic := '0';
        clear : in  std_logic := '1';
        q     : out std_logic := '0'
    );
end flipflopjk;

architecture behav of flipflopjk is

    signal qi : std_logic := '0';

begin
    process (clk, clear)
    begin
        if clear = '1' then
            qi <= '0';
        elsif falling_edge(clk) then
            if j = '0' and k = '1' then
                qi <= '0';
            elsif j = '1' and k = '0' then
                qi <= '1';
            elsif j = '1' and k = '1' then
                qi <= not qi;
            end if;
        end if;
    end process;
    q <= qi;

end behav;