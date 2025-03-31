--------------------------------------------------------------------------------
-- Diseñador: José de Jesús Morales Romero
-- Diseño: Sumador Completo de 2 bits
-- Componente: Sumador_Base.vhd
-- Fecha: --/--/----
-- Versión: 1.0
-- Comentarios: Sumador Completo de 2 bits con accareo de entrada y de salida
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Entradas | Salidas
-- C_in A B | Z C_out
--    0 0 0 | 0 0
--    0 0 1 | 1 0
--    0 1 0 | 1 0
--    0 1 1 | 0 1
--    1 0 0 | 1 0
--    1 0 1 | 0 1
--    1 1 0 | 0 1
--    1 1 1 | 1 1
-- z = C_in xor A xor B
-- C_out = (A and B) or ((A xor B) and C_in)
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity Sumador_Base is
    port
    (
        A, B : in std_logic;
        C_in : in std_logic;
        Z : out std_logic;
        C_out : out std_logic
    );
end Sumador_Base;

architecture rtl of Sumador_Base is
begin
    z <= C_in xor A xor B;
    C_out <= (A and B) or ((A xor B) and C_in);
end rtl;

