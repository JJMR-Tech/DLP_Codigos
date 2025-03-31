---------------------------------------------------------------------------------------
-- Autor: José de Jesús Morales Romero
-- Diseño: Multplixor de 16 a 1
-- Fecha: --/--/----
-- Cambios: --
-- Versión: 1.0
-- Comentarios: Archivo de definición de componentes
---------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

package Componentes is
    component Mux_4a1
        port
        (
            A, B, C, D : in std_logic;
            S : in std_logic_vector(1 downto 0);
            Z : out std_logic
        );
    end component;
end Componentes;