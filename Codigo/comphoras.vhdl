library ieee;
use ieee.std_logic_1164.all;

entity comphoras is
    port (
        clk      : in  std_logic                    := '0';
        decenas  : out std_logic                    := '0';
        unidades : out std_logic_vector(3 downto 0) := "0000"
    );
end comphoras;

architecture behav of comphoras is

    component contador0a9 is
        port(
            clk   : in  std_logic;
            clear : in  std_logic;
            q     : out std_logic_vector(3 downto 0);
            co    : out std_logic
        );
    end component;

    component flipflopjk is
        port(
            clk   : in  std_logic;
            j,k   : in  std_logic;
            clear : in  std_logic;
            q     : out std_logic
        );
    end component;

    signal clear : std_logic                    := '0';
    signal q9    : std_logic_vector(3 downto 0) := "0000";
    signal qf    : std_logic                    := '0';
    signal co    : std_logic                    := '0';

begin
        c09 : contador0a9 port map(clk, clear, q9, co);
        ff  : flipflopjk port map (co,'1','1',clear,qf);
    clear <= qf and q9(1) after 1 fs;
    decenas  <= qf;
    unidades <= q9;

end behav;