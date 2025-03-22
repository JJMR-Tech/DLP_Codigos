------------------------------------------------------------------------------------
-- Registros
-- Diseñador: José de Jesús Morales Romero
-- Archivo: Ej_08_Registros.vhd
-- Fecha: --/--/--
-- Versión: 1.0
-- Dependencias: Ninguna
-- Cambios: ----
------------------------------------------------------------------------------------

------------------------------------------------------------------------------------
-- Registro paralelo de 8 bits

library ieee;
use ieee.std_logic_1164.all;

entity registro_paralelo is
    port
    (
        D : in std_logic_vector(7 downto 0);
        clk : in std_logic;
        Q : out std_logic_vector(7 downto 0)
    );
end registro_paralelo;

architecture arquitectura of registro_paralelo is
begin
    Registro_Paralelo_8bits : process(clk, D)
    begin
        if clk'event and clk = '1' then
            Q <= D;
        end if;
    end process Registro_Paralelo_8bits;
end arquitectura;

------------------------------------------------------------------------------------
-- Registro paralelo de 4 bits con Clear

library ieee;
use ieee.std_logic_1164.all;

entity Registro_Paralelo_4_Bits is
    port
    (
        clk : in std_logic;
        clr : in std_logic;
        D : in std_logic_vector(3 downto 0);
        Q : out std_logic_vector(3 downto 0);
        Qn : out std_logic_vector(3 downto 0)
    );
end Registro_Paralelo_4_Bits;

architecture rtl of Registro_Paralelo_4_Bits is
begin
    process(clk, clr, D)
    begin
        if rising_edge(clk) then
            if clr = '1' then
                Q <= D;
                Qn <= not D;
            else
                Q <= (others => '0');
                Qn <= (others => '1');
            end if;
        end if;
    end process;
end rtl;