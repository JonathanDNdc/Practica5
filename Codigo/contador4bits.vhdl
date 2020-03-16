library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity contador4bits is
    port(
        clk   : in  std_logic := '0';
        clear : in  std_logic := '1';
        q     : out std_logic_vector(3 downto 0) := "0000"
    );
end contador4bits;

architecture behav of contador4bits is
    signal count : unsigned(3 downto 0) := "0000";
begin

    process (clk, clear)
    begin
        if clear = '1' then
            count <= "0000";
        elsif falling_edge(clk) then
            count <= count + 1;
        end if;
    end process;

    q <= std_logic_vector(count);

end behav;