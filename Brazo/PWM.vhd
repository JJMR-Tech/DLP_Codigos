--------------------------------------------------------------------------
-- Diseño: Generador PWM
-- Diseñador: José de Jesús Morales Romero
-- Fecha: --/--/----
-- Versión: 1.0
-- Notas: Generador PWM
--------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity PWM is
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
end PWM;

architecture rtl of PWM is

    ----------------------------------------------------------------------
    -- Temporales
    constant t_min : std_logic_vector(5 downto 0) := "01" & X"8";
    constant t_max : std_logic_vector(5 downto 0) := "11" & X"1";
    constant periodo : std_logic_vector(8 downto 0) := '1' & X"E8";
    signal cont : std_logic_vector(8 downto 0) := (others => '0');
    ----------------------------------------------------------------------

begin

    ----------------------------------------------------------------------
    Contador_Periodo : process(rst, clk, cont)
    begin
        if rst = '1' then
            cont <= (others => '0');
        else
            if rising_edge(clk) then
                if cont <= periodo then
                    cont <= cont + 1;
                else 
                    cont <= (others => '0');
                end if;
            end if;
        end if;
    end process Contador_Periodo;
    ----------------------------------------------------------------------
    PWM_Proceso : process(cont, val_PWM_1, val_PWM_2, val_PWM_3, val_PWM_4)
    begin
        if cont <= "000" & t_max then
            if cont(5 downto 0) <= t_max then

                if cont(5 downto 0) <= val_PWM_1 then
                    sal_PWM_1 <= '1';
                else
                    sal_PWM_1 <= '0';
                end if;

                if cont(5 downto 0) <= val_PWM_2 then
                    sal_PWM_2 <= '1';
                else
                    sal_PWM_2 <= '0';
                end if;

                if cont(5 downto 0) <= val_PWM_3 then
                    sal_PWM_3 <= '1';
                else
                    sal_PWM_3 <= '0';
                end if;

                if cont(5 downto 0) <= val_PWM_4 then
                    sal_PWM_4 <= '1';
                else
                    sal_PWM_4 <= '0';
                end if;
            else
                sal_PWM_1 <= '0';
                sal_PWM_2 <= '0';
                sal_PWM_3 <= '0';
                sal_PWM_4 <= '0';
            end if;
        else
            sal_PWM_1 <= '0';
            sal_PWM_2 <= '0';
            sal_PWM_3 <= '0';
            sal_PWM_4 <= '0';
        end if;
    end process PWM_Proceso;
    ----------------------------------------------------------------------
end rtl;

