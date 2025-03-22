------------------------------------------------------------------------------------
-- Máquinas secuenciales
-- Diseñador: José de Jesús Morales Romero
-- Archivo: Ej_11_Maquinas_Secuenciales.vhd
-- Fecha: --/--/--
-- Versión: 1.0
-- Dependencias: Ninguna
-- Cambios: ----
------------------------------------------------------------------------------------

------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity diagrama is
    port
    (
        clk, a : in std_logic;
        s : out std_logic
    );
end diagrama;

architecture arq_diagrama of diagrama is
    
    type estados is (d0, d1, d2, d3, d4);
    signal edo_presente, edo_futuro : estados;

begin

    Maquina : process(edo_presente, a) begin
        case edo_presente is
            when d0 => 
                if a = '1' then
                    edo_futuro <= d1;
                    s <= '0';
                else
                    edo_futuro <= d0;
                    s <= '0';
                end if;

            when d1 =>
                if a = '1' then
                    edo_futuro <= d2;
                    s <= '0';
                else
                    edo_futuro <= d0;
                    s <= '0';
                end if;

            when d2 =>
                if a = '1' then
                    edo_futuro <= d3;
                    s <= '0';
                else
                    edo_futuro <= d0;
                    s <= '0';
                end if;

            when d3 =>
                if a = '1' then 
                    edo_futuro <= d4;
                    s <= '1';
                else
                    edo_futuro <= d0;
                    s <= '0';
                end if;

            when d4 =>
                if a = '1' then
                    edo_futuro <= d1;
                    s <= '0';
                else
                    edo_futuro <= d0;
                    s <= '0';
                end if ;
        end case;
    end process Maquina;

    Avance_Maquina : process(clk) begin
        if rising_edge(clk) then
            edo_presente <= edo_futuro;
        end if;
    end process Avance_Maquina;

end arq_diagrama;