--------------------------------------------------------------------------
-- Diseño: DivFreq.vhd
-- Diseñador: José de Jesús Morales Romero
-- Fecha: --/--/----
-- Versión: 1.0
-- Notas: Componente: Difisor de frecuencia
--------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity DivFreq is
    port
    (
        clk_in : in std_logic;      -- f = 50MHz
        rst : in std_logic;
        clk_out : out std_logic     -- f = 
    );
end DivFreq;

architecture rtl of DivFreq is
    ----------------------------------------------------------------------
    constant length : integer := 11;
    signal cont : std_logic_vector(length - 1 downto 0) := (others => '0');
    ----------------------------------------------------------------------
begin

    ----------------------------------------------------------------------
    -- Proceso del contador
    Contador : process(clk_in, rst, cont)
    begin
        if rising_edge(clk_in) then
            if rst = '1' then
                cont <= (others => '0');
            else
                cont <= cont + 1;
            end if;
        end if;
    end process Contador;
    ----------------------------------------------------------------------

    clk_out <= cont(length - 1);

end rtl; -- rtl