------------------------------------------------------------------------------------
-- Diseño: Controlador de Servomotres
-- Diseñador: José de Jesús Morales Romero
-- Archivo: Componente: Generador de PWM
-- Versión: 1.0
-- Fecha: 05/04/2025
-- Revisión: 1.0
------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Generador_PWM is
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
end Generador_PWM;

architecture rtl of Generador_PWM is

    constant maxValor : unsigned(tamAngVec - 1 downto 0) := X"F4240";
    signal contador : unsigned(tamAngVec - 1 downto 0) := (others => '0');

begin

    Proceso_Contador : process(clk, rst, contador)
    begin
        if rst = '1' then
            contador <= (others => '0');
        else
            if rising_edge(clk) then
                if contador <= maxValor then
                    contador <= contador + 1;
                else
                    contador <= (others => '0');
                end if;
            end if;
        end if;
    end process Proceso_Contador;

    Proceso_Comparador : process(contador, angulo)
    begin
        if contador <= unsigned(angulo) then
            PWM <= '1';
        else
            PWM <= '0';
        end if;
    end process Proceso_Comparador;
end rtl;