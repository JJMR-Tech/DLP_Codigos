------------------------------------------------------------------------------------
-- Conversión de Binario Natural a Código de 7 Segmentos de Ánodo Común
-- Diseñador: José de Jesús Morales Romero
-- Versión: 1.0
-- Fecha: --/--/----
-- Notas:
------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity BinTo7Seg_AC is
    port
    (
        bin : in std_logic_vector(3 downto 0);
        sseg_ac : out std_logic_vector(6 downto 0)
    );
end BinTo7Seg_AC;

architecture rtl of BinTo7Seg_AC is
begin
    Deco : process(bin)
    begin
        case bin is                 -- abcdefg
            when "0000" => sseg_ac <= not("0000001"); -- 0
            when "0001" => sseg_ac <= not("1001111"); -- 1
            when "0010" => sseg_ac <= not("0010010"); -- 2
            when "0011" => sseg_ac <= not("0000110"); -- 3
            when "0100" => sseg_ac <= not("1001100"); -- 4
            when "0101" => sseg_ac <= not("0100100"); -- 5
            when "0110" => sseg_ac <= not("0100000"); -- 6
            when "0111" => sseg_ac <= not("0001110"); -- 7
            when "1000" => sseg_ac <= not("0000000"); -- 8
            when "1001" => sseg_ac <= not("0000100"); -- 9
            when "1010" => sseg_ac <= not("0001000"); -- A
            when "1011" => sseg_ac <= not("1100000"); -- B
            when "1100" => sseg_ac <= not("0110001"); -- C
            when "1101" => sseg_ac <= not("1000010"); -- D
            when "1110" => sseg_ac <= not("0110000"); -- E
            when "1111" => sseg_ac <= not("0111000"); -- F
            when others => sseg_ac <= not("1111111");
        end case;
    end process;
end rtl;