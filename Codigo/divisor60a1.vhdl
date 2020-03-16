library ieee;
use ieee.std_logic_1164.all;

entity divisor60a1 is
    port(
        clki : in  std_logic := '0';
        clko : out std_logic := '0'
    );
end divisor60a1;

architecture behav of divisor60a1 is

    component contador4bits is
        port(
            clk   : in  std_logic;
            clear : in  std_logic;
            q     : out std_logic_vector(3 downto 0)
        );
    end component;

    signal q1, q2 : std_logic_vector(3 downto 0) := "0000";
    signal clear  : std_logic                    := '0';
begin
    
    clear <= q1(3) and q1(2) and q1(1) and q1(0);
        c4b1 : contador4bits port map(clki, clear, q1);
        c4b2 : contador4bits port map(q1(3), '0', q2);
    clko <= q2(1);
end behav;