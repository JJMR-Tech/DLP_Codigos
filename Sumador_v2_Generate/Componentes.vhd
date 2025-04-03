--------------------------------------------------------------------------------
-- Diseñador: José de Jesús Morales Romero
-- Diseño: Sumador Completo de 2 bits
-- Archivo de Componentes
-- Fecha: --/--/----
-- Versión: 1.0
-- Comentarios: Sumador Completo de 2 bits con accareo de entrada y de salida
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

package Componentes is
    
    component Sumador_Base is
        port
        (
            A, B : in std_logic;
            C_in : in std_logic;
            Z : out std_logic;
            C_out : out std_logic
        );
    end component;

    component Sumador
        generic
        (
            nBits : integer := 4
        );
        port
        (
            A, B : in std_logic_vector(nBits - 1 downto 0);
            C_in : in std_logic;
            Z : out std_logic_vector(nBits - 1 downto 0);
            C_out : out std_logic
        );
    end component;
end Componentes;
