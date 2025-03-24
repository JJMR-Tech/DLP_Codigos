------------------------------------------------------------------------------------
-- Secuenciador AMD2909
-- Diseñador: José de Jesús Morales Romero
-- Archivo: MCP.vhd
-- Fecha: --/--/--
-- Versión: 1.0
-- Dependencias: Ninguna
-- Cambios: ----
------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity MPC is
    port
    (
        Cin, clk : in std_logic;
        Y : in std_logic_vector(3 downto 0);
        Cout : out std_logic;
        PC : inout std_logic_vector(3 downto 0)
    );
end MPC;

architecture arq_mpc of MPC is
begin
    process(clk, Y, Cin)
    begin
        if rising_edge(clk) then
            if Cin = '1' then
                PC <= Y + 1;
            else
                PC <= Y;
            end if;
        end if;
    end process;

    Cout <= (Cin and Y(0) and Y(1) and Y(2) and Y(3));
end arq_mpc;