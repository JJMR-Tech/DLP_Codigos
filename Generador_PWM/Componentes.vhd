------------------------------------------------------------------------------------
-- Diseño: Controlador de Servomotores
-- Diseñador: José de Jesús Morales Romero
-- Archivo: Componente: Generador de PWM
-- Versión: 1.0
-- Fecha: 05/04/2025
-- Revisión: 1.0
------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

package Componentes is
    component Generador_PWM
        generic
        (
            tamAngVec : integer := 20
        );
        port
        (
            clk : in std_logic;
            rst : in std_logic;
            angulo : in std_logic_vector(tamAngVec - 1 downto 0);
            PWM : out std_logic
        );
    end component;

    component Ctrl_Angulo
        generic
        (
            tamAngVec : integer := 20
        );
        port
        (
            clk : in std_logic;
            rst : in std_logic;
            Positivo : in std_logic;
            Negativo : in std_logic;
            Angulo : out std_logic_vector(tamAngVec - 1 downto 0)
        );
    end component;
end package ;