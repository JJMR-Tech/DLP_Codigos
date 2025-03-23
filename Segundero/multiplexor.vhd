library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Multiplexor is
    port
    (
        clk : in std_logic;
        unidades : in std_logic_vector(3 downto 0);
        decenas : in std_logic_vector(3 downto 0);
        binario : out std_logic_vector(3 downto 0);
        control : out std_logic_vector(1 downto 0)
    );
end Multiplexor;

architecture rtl of Multiplexor is
    signal contador : std_logic_vector(7 downto 0) := (others => '0');
begin

    process(clk)
    begin
        if clk = '0' then
            control <= "01";
            binario <= unidades;
        else
            control <= "10";
            binario <= decenas;
        end if;
    end process;

end rtl;