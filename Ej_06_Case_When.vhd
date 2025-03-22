------------------------------------------------------------------------------------
-- Enunciado Case - When
-- Diseñador: José de Jesús Morales Romero
-- Archivo: Ej_06_Case_When.vhd
-- Fecha: --/--/--
-- Versión: 1.0
-- Dependencias: Ninguna
-- Cambios: ----
------------------------------------------------------------------------------------

-- Ejemplo: Display de 7 Segmentos de ánodo común

library ieee;
use ieee.std_logic_1164.all;

entity Deco_BCD_7_Seg is
    port
    (
        -- Entradas
        A : in std_logic_vector(3 downto 0);
        -- Salidas
        D : out std_logic_vector(6 downto 0)
    );
end Deco_BCD_7_Seg;

architecture rtl of Deco_BCD_7_Seg is
begin
    Deco : process(A)
    begin
        case A is
            when "0000" => D <= "0000001";
            when "0001" => D <= "1001111";
            when "0010" => D <= "0010010";
            when "0011" => D <= "0000110";
            when "0100" => D <= "1001100";
            when "0101" => D <= "0100100";
            when "0110" => D <= "0100000";
            when "0111" => D <= "0001110";
            when "1000" => D <= "0000000";
            when "1001" => D <= "0000100";
            when others => D <= "1111111";
        end case;
    end process;
end rtl;
------------------------------------------------------------------------------------

------------------------------------------------------------------------------------
-- Ejercicios
-- Realizar el decodifiacor Binario Natura a 7 Segmentos de ánodo común y cátodo
--      común. Se deben de tomar todos los casos (los 16 casos). Para los valores
--      10 a 15 deben ser descritos con A, B, C, D, E y F respectivamente.
------------------------------------------------------------------------------------