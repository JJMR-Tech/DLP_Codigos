--------------------------------------------------------------------------
-- Diseño: Componentes.vhd
-- Diseñador: José de Jesús Morales Romero
-- Fecha: --/--/----
-- Versión: 1.0
-- Notas: Archivo de componentes : Componentes
--------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

package Componentes is
    component DivFreq
        port
        (
            clk_in : in std_logic;
            rst : in std_logic;
            clk_out : out std_logic
        );
    end component DivFreq;

    component PWM
        port
        (
            clk : in std_logic;
            rst : in std_logic;
            val_PWM_1 : in std_logic_vector(5 downto 0);
            val_PWM_2 : in std_logic_vector(5 downto 0);
            val_PWM_3 : in std_logic_vector(5 downto 0);
            val_PWM_4 : in std_logic_vector(5 downto 0);
            sal_PWM_1 : out std_logic;
            sal_PWM_2 : out std_logic;
            sal_PWM_3 : out std_logic;
            sal_PWM_4 : out std_logic
        );
    end component;
end package Componentes;