------------------------------------------------------------------------------------
-- Secuenciador AMD2909
-- Diseñador: José de Jesús Morales Romero
-- Archivo: Stack.vhd
-- Fecha: --/--/--
-- Versión: 1.0
-- Dependencias: Ninguna
-- Cambios: ----
------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity stack is
    port
    (
        clk, FE, Push_Pop : in std_logic;
        PC : in std_logic_vector(3 downto 0);
        ST : inout std_logic_vector(3 downto 0)
    );
end stack;

architecture arq_stack of stack is
    signal var : std_logic_vector(3 downto 0) := (others => '0');
begin
    process(FE, clk, Push_Pop, PC, ST)
        variable x : std_logic_vector(3 downto 0) := (others => '0');
    begin
        if rising_edge(clk) then
            if FE = '0' then
                if Push_Pop = '1' then
                    x := PC;    -- Alamacena el dato
                    var <= x;
                else
                    ST <= var;
                end if;
            else
                ST <= ST;
            end if;
        end if;
    end process;
end arq_stack;