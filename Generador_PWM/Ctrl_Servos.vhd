------------------------------------------------------------------------------------
-- Diseño: Controlador de Servomotores
-- Diseñador: José de Jesús Morales Romero
-- Archivo: Top-Level: Controlador de Servomotores
-- Versión: 1.0
-- Fecha: 05/04/2025
-- Revisión: 1.0
------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Componentes.all;

entity Ctrl_Servos is
    port
    (
        clk : in std_logic;         -- Frecuencia principal = 50MHz
        rst : in std_logic;         -- Reset general
        Positivo : in std_logic;    -- Aumenta el ángulo
        Negativo : in std_logic;    -- Disminuye el ángulo
        PWM : out std_logic
    );
end Ctrl_Servos;

architecture rtl of Ctrl_Servos is
    signal Angulo : std_logic_vector(19 downto 0);
begin
    
    Control : Ctrl_Angulo
    port map
    (
        clk => clk, rst => rst, Positivo => Positivo, Negativo => Negativo,
        Angulo => Angulo
    );

    Servo_PWM : Generador_PWM
    port map
    (
        clk => clk, rst => rst, Angulo => Angulo,
        PWM => PWM
    );

end rtl;