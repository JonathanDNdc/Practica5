library ieee;
use ieee.std_logic_1164.all;

entity relojdigital is
end relojdigital;

architecture behav of relojdigital is

    component divisor60a1 is
        port(
            clki : in  std_logic := '0';
            clko : out std_logic := '0'
        );
    end component;

    component comphoras is
        port (
            clk      : in  std_logic                    := '0';
            decenas  : out std_logic                    := '0';
            unidades : out std_logic_vector(3 downto 0) := "0000"
        );
    end component;

    component compminsec is
        port (
            clk      : in  std_logic                    := '0';
            decenas  : out std_logic_vector(3 downto 0) := "0000";
            unidades : out std_logic_vector(3 downto 0) := "0000"
        );
    end component;

    constant clk_period        : time                         := 1 ps;
    signal clk_s, clk_m, clk_h : std_logic                    := '0';
    signal sec_u, sec_d        : std_logic_vector(3 downto 0) := "0000";
    signal min_u, min_d        : std_logic_vector(3 downto 0) := "0000";
    signal hour_u              : std_logic_vector(3 downto 0) := "0000";
    signal hour_d              : std_logic                    := '0';

begin
    clk_s <= not clk_s after clk_period/2;
        d601sm : divisor60a1 port map(clk_s, clk_m);
        d601mh : divisor60a1 port map(clk_m, clk_h);

        compsec  : compminsec port map(clk_s, sec_d, sec_u);
        compmin  : compminsec port map(clk_m, min_d, min_u);
        comphour : comphoras port map(clk_h, hour_d, hour_u);

    process
    begin
        wait;
    end process;
end behav;