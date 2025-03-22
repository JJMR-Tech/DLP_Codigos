------------------------------------------------------------------------------------
-- Enunciado When - Else
-- Diseñador: José de Jesús Morales Romero
-- Archivo: Ej_02_When_Else.vhd
-- Fecha: --/--/--
-- Versión: 1.0
-- Dependencias: Ninguna
-- Cambios: ----
------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity Ej_02_When_Else is
    port
    (
        -- Entradas
        A, B, C : in std_logic;
        -- Salidas
        P, Q, R : out std_logic
    );
end Ej_02_When_Else;

architecture when_else of Ej_02_When_Else is
begin
    P <= '1' when (not A and not B and not C) else
         '1' when (not A and not B and C) else
         '1' when (not A and B and C) else
         '1' when (A and B and C) else
         '0';

    -- El alumno debe realizar las estructuras para Q y R
end when_else;