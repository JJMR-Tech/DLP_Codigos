------------------------------------------------------------------------------------
-- Ecuaciones Booleanas
-- Diseñador: José de Jesús Morales Romero
-- Archivo: Ej_01_Ecuaciones_Booleanas.vhd
-- Fecha: --/--/--
-- Versión: 1.0
-- Dependencias: Ninguna
-- Cambios: ----
------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity Ej_01_Ecuaciones_Booleanas is
    port
    (
        -- Entradas
        A, B, C : in std_logic;
        -- Salidas
        P, Q, R : out std_logic
    );
end Ej_01_Ecuaciones_Booleanas;

architecture ecuaciones_booleanas of Ej_01_Ecuaciones_Booleanas is
begin
    P <= (not A and not B and not C) or (not A and not B and C) or (not A and B and C) or (A and B and C);

    Q <= (not A and not B and C) or (A and not B and C) or (A and B and not C);

    R <= (not A and not b and not C) or (not A and B and not C) or (not A and B and C);
end ecuaciones_booleanas;
