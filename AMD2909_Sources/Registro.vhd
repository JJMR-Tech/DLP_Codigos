------------------------------------------------------------------------------------
-- Secuenciador AMD2909
-- Diseñador: José de Jesús Morales Romero
-- Archivo: Registro.vhd
-- Fecha: --/--/--
-- Versión: 1.0
-- Dependencias: Ninguna
-- Cambios: ----
------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity Registro is
    port
    (
        R : in std_logic_vector(3 downto 0);
        ER, clk : in std_logic;
        Reg : inout std_logic_vector(3 downto 0)
    );
end Registro;

architecture arq_reg of registro is
begin
    Reg_proceso : process(clk, ER, Reg, R)
    begin
        if rising_edge(clk) then
            if ER = '0' then
                Reg <= R;
            else
                Reg <= Reg;
            end if;
        end if;
    end process Reg_proceso;
end arq_reg;