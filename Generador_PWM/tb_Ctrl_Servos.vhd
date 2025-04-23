------------------------------------------------------------------------------------
-- Diseño: Controlador de Servomotres
-- Diseñador: José de Jesús Morales Romero
-- Archivo: Archivo de banco de pruebas
-- Versión: 1.0
-- Fecha: 05/04/2025
-- Revisión: 1.0
------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity tb_Ctrl_Servos is
end tb_Ctrl_Servos;

architecture rtl of tb_Ctrl_Servos is

    component Ctrl_Servos
        port
        (
            clk : in std_logic;         -- Frecuencia principal = 50MHz
            rst : in std_logic;         -- Reset general
            Positivo : in std_logic;    -- Aumenta el ángulo
            Negativo : in std_logic;    -- Disminuye el ángulo
            PWM : out std_logic
        );
    end component;

    signal clk : std_logic := '0';
    signal rst : std_logic := '0';
    signal Positivo : std_logic := '0';
    signal Negativo : std_logic := '0';
    signal PWM : std_logic;

    constant periodo : time := 20 ns;

begin

    uut : Ctrl_Servos
    port map
    (
        clk => clk, rst => rst, Positivo => Positivo, Negativo => Negativo,
        PWM => PWM
    );

    clk_proceso : process
    begin
        clk <= '0';
        wait for periodo/2;
        clk <= '1';
        wait for periodo/2;
    end process clk_proceso;

    estimulos : process
    begin
        wait for 20 ns;
        rst <= '0';
        Positivo <= '0', '1' after 15 ms, '0'after 15.02 ms, '1' after 30 ms, '0' after 30.02 ms;
        Negativo <= '0';
        wait;
    end process estimulos;

end rtl;