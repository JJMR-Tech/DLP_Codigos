------------------------------------------------------------------------------------
-- Enunciado If - Then - Elsif - Then - Else - End if
-- Diseñador: José de Jesús Morales Romero
-- Archivo: Ej_05_If_then_else.vhd
-- Fecha: --/--/--
-- Versión: 1.0
-- Dependencias: Ninguna
-- Cambios: ----
------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity comparador is
    port
    (
        -- Entradas
        a, b : in std_logic_vector(1 downto 0);
        -- Salidas
        c : out std_logic
    );
end comparador;

architecture rtl  of comparador is
begin
    Compara : process(a, b)
    begin
        if a = b then
            c <= '1';
        else
            c <= '0';
        end if;
    end process Compara;
end rtl;

library ieee;
use ieee.std_logic_1164.all;

entity tri_estado  is
    port
    (
        -- Entradas
        entrable, entrada : in std_logic;
        -- Salidas
        salida : out std_logic
    );
end tri_estado;

architecture rtl of tri_estado is
begin
    process(enable, entrada)
    begin
        if enable = '0' then
            salida <= 'Z';
        else
            salida <= entrada;
        end if;
    end process;
end rtl;

library ieee;
use ieee.std_logic_1164.all;

entity comparador_2 is
    port
    (
        -- Entradas
        a, b : in std_logic_vector(1  downto 0);
        -- Salidas
        c : out std_logic_vector(1 downto 0)
    );
end comparador_2;

architecture rtl of comparador_2 is
begin
    Compara_2 : process(a, b)
    begin
        if a = b then
            c <= "11";
        elsif a < b then
            c <= "01";
        else
            c <= "10";
        end if;
    end process Compara_2;
end rtl;

------------------------------------------------------------------------------------
-- Ejercicio 
-- Realizar un decoficador BCD a Decimal
--       -----------
--       | BCD/Dec | -> a
-- m0 -> |         | -> b
-- m1 -> |         | -> c
-- m2 -> |         | -> d
-- m3 -> |         | -> e
--       |         | -> f
--       |         | -> g
--       |         | -> h
--       |         | -> i
--       |         | -> j
--       -----------
------------------------------------------------------------------------------------