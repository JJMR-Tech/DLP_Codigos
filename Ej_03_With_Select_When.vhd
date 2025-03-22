------------------------------------------------------------------------------------
-- Enunciado When - Else
-- Diseñador: José de Jesús Morales Romero
-- Archivo: Ej_03_With_Select_When.vhd
-- Fecha: --/--/--
-- Versión: 1.0
-- Dependencias: Ninguna
-- Cambios: ----
------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity Ej_03_With_Select_When
    port
    (
        -- Entrada
        A, B, C : in std_logic;
        -- Salidas
        P, Q, R : out std_logi
    );
end Ej_03_With_Select_When;

architecture rtl  of Ej_03_With_Select_When is
    -- Señal temporal utilizada para concatenar las entradas
    signal Entradas : std_logic_vector(2 downto 0);
    
begin
    Entradas <= A & B & C;

    with Entradas select
        P <= '1' when "000", -- Se hace notar el uso de la ','
             '1' when "001",
             '1' when "011",
             '1' when "111",
             '0'when others;

    -- El alumno debe realizar la selección para los casos de Q y R

end rtl;