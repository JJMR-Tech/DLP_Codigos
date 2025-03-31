---------------------------------------------------------------------------------------
-- Autor: José de Jesús Morales Romero
-- Diseño: Multplixor 4:!
-- Fecha: --/--/----
-- Cambios: --
-- Versión: 1.0
-- Comentarios: N/A
---------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity Mux_4a1 is
    port
    (
        A, B, C, D : in std_logic;
        S : in std_logic_vector(1 downto 0);
        Z : out std_logic
    );
end Mux_4a1;

architecture rtl of Mux_4a1 is
begin

    with S select
        Z <= A when "00",
             B when "01",
             C when "10",
             D when others;

end rtl;