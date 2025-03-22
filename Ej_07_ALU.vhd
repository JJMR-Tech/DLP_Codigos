------------------------------------------------------------------------------------
-- ALU
-- Diseñador: José de Jesús Morales Romero
-- Archivo: Ej_07_ALU.vhd
-- Fecha: --/--/--
-- Versión: 1.0
-- Dependencias: Ninguna
-- Cambios: ----
------------------------------------------------------------------------------------
-- 2 Puntos Extras para el segundo parcial
-- Realizar la implementación, en el CPLD, de la siguiente ALU
-- -------------------------------------
-- OpCode | M = H           | M = L 
--  0  0  | F = /A          | F = A + 1
--  0  1  | F = /(A or B)   | F = A + B
--  1  0  | F = /(A and B)  | F = A - B
--  1  1  | F = /B          | F = B + 1
-- -------------------------------------
-- 5 puntos extras si se implementa la ALU 74LS181
------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity ALU is
    port
    (
        A, B : in std_logic_vector(3 downto 0);     -- Operandos de entrada
        OpCode : in std_logic_vector(1 downto 0);   -- Código de operación
        M : in std_logic;                           -- Selector: Lógico / Aritmético
        C : out std_logic                           -- Acarreo de salida
    );
end ALU;

architecture rtl of ALU is
begin

end rtl;