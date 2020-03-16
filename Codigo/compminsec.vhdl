library ieee;
use ieee.std_logic_1164.all;

entity compminsec is
    port (
        clk      : in  std_logic                    := '0';
        decenas  : out std_logic_vector(3 downto 0) := "0000";
        unidades : out std_logic_vector(3 downto 0) := "0000"
    );
end compminsec;

architecture behav of compminsec is

    component contador0a9 is
        port(
            clk   : in  std_logic;
            clear : in  std_logic;
            q     : out std_logic_vector(3 downto 0);
            co    : out std_logic
        );
    end component;

    signal clear : std_logic                    := '0';
    signal q5    : std_logic_vector(3 downto 0) := "0000";
    signal co    : std_logic                    := '0';

begin
        c09a : contador0a9 port map(clk, clear, unidades, co);
        c09b : contador0a9 port map(co, clear, q5);
    clear   <= q5(1) and q5(2);
    decenas <= q5;


end behav;