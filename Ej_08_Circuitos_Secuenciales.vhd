------------------------------------------------------------------------------------
-- Enunciado Circuitos Secuenciales
-- Diseñador: José de Jesús Morales Romero
-- Archivo: Ej_07_Circuitos_Secuenciales.vhd
-- Fecha: --/--/--
-- Versión: 1.0
-- Dependencias: Ninguna
-- Cambios: ----
------------------------------------------------------------------------------------
-- Tarea 1: Traer en su cuaderno la clasificación de los circuitos secuenciales
--  - Asíncronos
--  - Síncronos
--  - Mixtos
-- Así como un diagrama representativo de cado uno de ellos indicando sus 
--      caracterísitcas y diferencias con respecto al resto.
--
-- Tarea 2: Traer en su cuaderno la clasficación de los elementos de memoria (flip -
--      flops), así como sus tablas de verdad.
--  - SR
--  - JK
--  - D
--  - T
------------------------------------------------------------------------------------

------------------------------------------------------------------------------------
-- Flip-flop tipo D
library ieee;
use ieee.std_logic_1164.all;

entity ffd is 
    port
    (
        D, clk : in std_logic;
        Q : out std_logic
    );
end ffd;

architecture comportamiento of ffd is
begin
    Flip_Flop_D : process(clk, D)
    begin
        if rising_edge(clk) then
            Q <= D;
        end if;
    end process Flip_Flop_D;
end comportamiento;
------------------------------------------------------------------------------------

------------------------------------------------------------------------------------
-- Flip-flop tipo RS
library ieee;
use ieee.std_logic_1164.all;

entity ffrs is 
    port
    (
        S, R, clk : in std_logic;
        Q, Qn : buffer std_logic
    );
end ffrs;

architecture arquitectura of ffrs is
begin
    process(clk, R, S)
    begin
        if rising_edge(clk) then
            if S = '0' and R = '1' then
                Q <= '0';
                Qn <= '1';
            elsif S = '1' and R = '0' then
                Q <= '1';
                Qn <= '0';
            elsif S = '0' and R = '0' then
                Q <= Q;
                Qn <= Qn;
            else
                Q <= '-';
                Qn <= '-';
            end if;
        end if;
    end process;
end arquitectura;
------------------------------------------------------------------------------------

------------------------------------------------------------------------------------
-- Realizar la implementación para los flip-flop tipo:
-- JK y T
------------------------------------------------------------------------------------
