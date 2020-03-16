library ieee;
use ieee.std_logic_1164.all;

entity contador0a9 is
    port(
        clk   : in  std_logic := '0';
        clear : in  std_logic := '1';
        q     : out std_logic_vector(3 downto 0) := "0000";
        co    : out std_logic := '0'
    );
end contador0a9;

architecture behav of contador0a9 is

    component contador4bits is
        port(
            clk   : in  std_logic;
            clear : in  std_logic;
            q     : out std_logic_vector(3 downto 0)
        );
    end component;
    signal cleari : std_logic                    := '0';
    signal qi     : std_logic_vector(3 downto 0) := "0000";
begin
    cleari <= clear or (qi(3) and qi(1));
        c4b : contador4bits port map(clk, cleari, qi);
    q <= qi;
    co <= qi(3) and qi(0);

end behav;