------------------------------------------------------------------------------------
-- Secuenciador AMD2909
-- Diseñador: José de Jesús Morales Romero
-- Archivo: Mux_4.vhd
-- Fecha: --/--/--
-- Versión: 1.0
-- Dependencias: Ninguna
-- Cambios: ----
------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity Mux_4 is
    port
    (
        D, R, ST, PC : in std_logic_vector(3 downto 0);
        S : in std_logic_vector(1 downto 0);
        Y : inout std_logic_vector(3 downto 0)
    );
end Mux_4;

architecture arq_mux of mux_4 is
begin
    with S select
        Y <= PC when "00",
             ST when "01",
             R  when "10",
             D  when others;
end arq_mux;