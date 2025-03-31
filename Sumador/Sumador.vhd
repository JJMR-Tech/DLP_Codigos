--------------------------------------------------------------------------------
-- Diseñador: José de Jesús Morales Romero
-- Diseño: Sumador Completo de 2 bits
-- Archivo Top-Level
-- Fecha: --/--/----
-- Versión: 1.0
-- Comentarios: Sumador Completo de 2 bits con accareo de entrada y de salida
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Componentes.all;

entity Sumador is
    port
    (
        A, B : in std_logic_vector(3 downto 0);
        C_in : in std_logic;
        Z : out std_logic_vector(3 downto 0);
        C_out : out std_logic
    );
end Sumador;

architecture rtl of Sumador is
    signal Carry_in : std_logic_vector(0 to 3) := (others => '0');
begin

    Sumador_1 : Sumador_Base
        port map
        (
            A => A(0), B => B(0), C_in => C_in,
            Z => Z(0), C_out => Carry_in(0)
        );

    Sumador_4bits : for i in 1 to 3 generate
        Adder_4bits : Sumador_Base 
        port map
        (
            A => A(i), B => B(i), C_in => Carry_in(i - 1),
            Z => Z(i), C_out => Carry_in(i)
        );
    end generate;

    C_out <= Carry_in(3);

end rtl;

