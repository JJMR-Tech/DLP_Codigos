library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Reloj is 
    port
    (
        clk : in std_logic;
        rst : in std_logic;
        unidades : out std_logic_vector(3 downto 0);
        decenas : out std_logic_vector(3 downto 0);
        clk_ext : out std_logic
    );
end Reloj;

architecture rtl of Reloj is
    
    constant nBits : integer := 26;
    constant periodo_1s : std_logic_vector(nBits - 1 downto 0) := "10" & X"FAF080";
    signal contador : std_logic_vector(nBits - 1 downto 0) := (others => '0');
    signal cont_unidades : std_logic_vector(3 downto 0) := (others => '0');
    signal cont_decenas : std_logic_vector(3 downto 0) := (others => '0');
    
begin
    process(clk, rst, contador, cont_unidades)
    begin
        if rst = '1' then
            contador <= (others => '0');
            cont_unidades <= (others => '0');
        else
            if rising_edge(clk) then
                if contador < periodo_1s then
                    contador <= contador + 1;
                    cont_unidades <= cont_unidades;
                else
                    contador <= (others => '0');
                    if cont_unidades < X"9" then
                        cont_unidades <= cont_unidades + 1;
                    else
                        cont_unidades <= (others => '0');
                    end if;
                end if;
            end if;
        end if;
    end process;

    clk_ext <= contador(12);

    unidades <= cont_unidades;
    decenas <= (others => '0');
end rtl;