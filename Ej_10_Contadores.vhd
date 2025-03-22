------------------------------------------------------------------------------------
-- Contadores
-- Diseñador: José de Jesús Morales Romero
-- Archivo: Ej_10_Contadores.vhd
-- Fecha: --/--/--
-- Versión: 1.0
-- Dependencias: Ninguna
-- Cambios: ----
------------------------------------------------------------------------------------

------------------------------------------------------------------------------------
-- Contador ascendente de 4 bits

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity contador_4bits is
    port
    (
        clk : in std_logic;
        Q : out std_logic_vector(3 downto 0)
    );
end contador_4bits;

architecture rtl of contador_4bits is 
begin
    process(clk)
    begin
        if rising_edge(clk) then
            Q <= Q + 1;
        end if;
    end process;
end rtl;


------------------------------------------------------------------------------------
-- Contador ascendente/descendente

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity cont_asc_desc is
    port
    (
        clk : in std_logic;
        up : in std_logic;
        Q : out std_logic_vector(3 downto 0)
    );
end cont_asc_desc;

architecture rtl of cont_asc_desc is
begin
    process(clk, up)
    begin
        if rising_edge(clk) then
            if up = '0' then
                Q <= Q + 1;
            else
                Q <= Q - 1;
            end if;
        end if;
    end process;
end rtl;

------------------------------------------------------------------------------------
-- Contador de 4 bits con reset y carga en paralelo

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity conta is
    port
    (
        P : in std_logic_vector(3 downto 0);
        clk : in std_logic;
        Load, Reset, Enp : in std_logic;
        Q : buffer std_logic_vector(3 downto 0)
    );
end conta;

architecture arq_cont of conta is
begin
    process(clk, Reset, Load, Enp, P)
    begin
        if Reset = '1' then   -- <-- Operación asíncrona
            Q <= (others => '0');
        elsif clk'event and clk = '1' then
            if Load = '0' and Enp = '-' then
                Q <= P;
            elsif Load = '1' and Enp = '0' then
                Q <= Q;
            elsif Load = '1' and Enp = '1' then
                Q <= Q + 1;
            end if;
        end if;
    end process;
end arq_cont;