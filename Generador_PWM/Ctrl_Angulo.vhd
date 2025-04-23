------------------------------------------------------------------------------------
-- Diseño: Controlador de Servomotres
-- Diseñador: José de Jesús Morales Romero
-- Archivo: Componente: Control del PWM
-- Versión: 1.0
-- Fecha: 05/04/2025
-- Revisión: 1.0
------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Ctrl_Angulo is
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
end Ctrl_Angulo;

architecture rtl of Ctrl_Angulo is

    --------------------------------------------------------------------------------
    -- Señales para el ángulo
    constant valMin : integer := 50_000;    -- Valor del ángulo mínimo
    constant paso : integer := 2_778;       -- Valor mínimo del paso
    constant valMax : integer := 100_000;    -- Valor del ángulo máximo
    signal temp_Ang : integer range 50_000 to 100_000;
    
    --------------------------------------------------------------------------------
    -- Señales para el filtro
    constant nBits_AR : integer := 10;  -- Filtro anti-rebote
    signal cont_AR : std_logic_vector(nBits_AR downto 0) := (others => '0');
    --------------------------------------------------------------------------------
    -- Máquina de estados
    type Estados is (Idle, Lee_Positivo, Aumenta, Lee_Negativo, Disminuye, Anti_Rebote);
    signal Edo : Estados;
    --------------------------------------------------------------------------------

begin

    --------------------------------------------------------------------------------
    -- Máquina de estados
    Maquina : process(clk, rst, Edo)
    begin
        if rst = '1' then
            Edo <= Idle;
            temp_Ang <= valMin;
        else
            if rising_edge(clk) then
                case Edo is
                    when Idle =>
                    	Edo <= Lee_Positivo;
                        cont_AR <= (others => '0');
                        temp_Ang <= temp_Ang;

                    when Lee_Positivo =>
                        if Positivo = '1' then
                            Edo <= Aumenta;
                        else
                            Edo <= Lee_Negativo;
                        end if;
                        cont_AR <= (others => '0');
                        temp_Ang <= temp_Ang;

                    when Aumenta =>
                        if temp_Ang < valMax then
                            temp_Ang <= temp_Ang + paso;
                        else
                            temp_Ang <= valMax;
                        end if;
                        cont_AR <= (others => '0');
                        Edo <= Anti_Rebote;
                        
                    when Lee_Negativo =>
                        if Negativo = '1' then
                            Edo <= Disminuye;
                        else
                            Edo <= Idle;
                        end if;
                        cont_AR <= (others => '0');

                    when Disminuye =>
                        if temp_Ang > valMin then
                            temp_Ang <= temp_Ang - paso;
                        else
                            temp_Ang <= valMin;
                        end if;
                        cont_AR <= (others => '0');
                        Edo <= Anti_Rebote;

                    when Anti_Rebote =>
                        if cont_AR(nBits_AR) = '1' then
                            cont_AR <= (others => '0');
                            Edo <= Idle;
                        else
                            cont_AR <= cont_AR + 1;
                            Edo <= Anti_Rebote;
                        end if;

                    when others => null;

                end case;
            end if;
        end if;
    end process Maquina;

    Angulo <= std_logic_vector(to_unsigned(temp_Ang, tamAngVec));
    --------------------------------------------------------------------------------
end rtl;