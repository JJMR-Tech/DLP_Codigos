--------------------------------------------------------------------------
-- Diseño: Brazo.vhd
-- Diseñador: José de Jesús Morales Romero
-- Fecha: --/--/----
-- Versión: 1.0
-- Notas: Top Level : Brazo
--------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Componentes.all;

entity Brazo is
    port
    (
        clk_50MHz : in std_logic;
        rst : in std_logic;
        val_PWM_1 : in std_logic_vector(5 downto 0);
        val_PWM_2 : in std_logic_vector(5 downto 0);
        val_PWM_3 : in std_logic_vector(5 downto 0);
        val_PWM_4 : in std_logic_vector(5 downto 0);
        PWM_1 : out std_logic;
        PWM_2 : out std_logic;
        PWM_3 : out std_logic;
        PWM_4 : out std_logic
    );
end Brazo;

architecture rtl of Brazo is
    ----------------------------------------------------------------------
    signal clk : std_logic := '0';
    ----------------------------------------------------------------------
begin

    ----------------------------------------------------------------------
    -- Componentes externos
    DivisorFrecuencia : DivFreq
    port map
    (
        clk_in => clk_50MHz, rst => rst,
        clk_out => clk
    );

    PWMs : PWM
    port map
    (
        clk => clk, rst => rst, 
        val_PWM_1 => val_PWM_1, val_PWM_2 => val_PWM_2, val_PWM_3 => val_PWM_3, val_PWM_4 => val_PWM_4,
        sal_PWM_1 => PWM_1, sal_PWM_2 => PWM_2, sal_PWM_3 => PWM_3, sal_PWM_4 => PWM_4
    );

end rtl; -- rtl