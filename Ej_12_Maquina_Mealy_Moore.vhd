------------------------------------------------------------------------------------
-- Máquinas de Moore
-- Diseñador: José de Jesús Morales Romero
-- Archivo: Ej_12_Maquinas_Mealy_Moore.vhd
-- Fecha: --/--/--
-- Versión: 1.0
-- Dependencias: Ninguna
-- Cambios: ----
------------------------------------------------------------------------------------

------------------------------------------------------------------------------------
-- Máquina de Mealy
library ieee;
use ieee.std_logic_1164.all;

entity Mealy is
    port
    (
        clk, a : in std_logic;
        s : out std_logic
    );
end Mealy;

architecture arq_Mealy of Mealy is
    type Estados is (S0, S1, S2, S3);
    signal Edo_Pres, Edo_Fut : Estados;
begin
    Maquina : process(Edo_Pres, a)
    begin
        case Edo_Pres is
            when S0 =>
                if a = '0' then
                    s <= '0';
                    Edo_Fut <= S0;
                else
                    s <= '1';
                    Edo_Fut <= S2;
                end if;

            when S1 =>
                if a = '0' then
                    s <= '0';
                    Edo_Fut <= S0;
                else
                    s <= '1';
                    Edo_Fut <= S2;
                end if;

            when S2 =>
                if a = '0' then
                    s <= '1';
                    Edo_Fut <= S2;
                else
                    s <= '0';
                    Edo_Fut <= S3;
                end if;

            when S3 =>
                if a = '0' then
                    s <= '0';
                    Edo_Fut <= S3;
                else
                    s <= '1';
                    Edo_Fut <= S1;
                end if;
        end case;
    end process Maquina;

    Avance_Maquina : process(clk)
    begin
        if rising_edge(clk) then
            Edo_Pres <= Edo_Fut;
        end if;
    end process Avance_Maquina;
end arq_Mealy;
------------------------------------------------------------------------------------

------------------------------------------------------------------------------------
-- Máquina de Moore
library ieee;
use ieee.std_logic_1164.all;

entity Moore is 
    port
    (
        a, clk : in std_logic;
        s : out std_logic
    );
end Moore;

architecture arq_moore of Moore is
    type Estados is (S0, S1, S2, S3);
    signal Edo_Pres, Edo_Fut : Estados;
begin
    Maquina : process(Edo_Pres, a)
    begin
        case Edo_Pres is
            when S0 => 
                s <= '0';
                if a = '0' then
                    Edo_Fut <= S0;
                else
                    Edo_Fut <= S2;
                end if;

            when S1 =>
                s <= '1';
                if a = '0' then
                    Edo_Fut <= S0;
                else
                    Edo_Fut <= S2;
                end if;

            when S2 =>
                s <= '1';
                if a = '0' then
                    Edo_Fut <= S2;
                else
                    Edo_Fut <= S3;
                end if;

            when S3 =>
                s <= '0';
                if a = '0' then
                    Edo_Fut <= S3;
                else
                    Edo_Fut <= S1;
                end if;
        end case;
    end process Maquina;

    Avance_Maquina : process(clk)
    begin
        if rising_edge(clk) then
            Edo_Pres <= Edo_Fut;
        end if;
    end process Avance_Maquina;
end arq_moore;
------------------------------------------------------------------------------------

------------------------------------------------------------------------------------
-- Máquina Mixta
library ieee;
use ieee.std_logic_1164.all;

entity mixta is
    port
    (
        clk, a : in std_logic;
        s : out std_logic
    );
end mixta;

architecture rtl of mixta is 
    
    type estados is (q0, q1, q2, q3, q4);
    signal edo_pres, edo_fut : estados;

begin
    Maquina_Mixta : process(edo_pres, a)
    begin
        case edo_pres is
            when q0 =>
                s <= '0';
                if a = '0' then
                    edo_fut <= q4;
                else
                    edo_fut <= q1;
                end if;

            when q1 =>
                s <= '0';
                if a = '0' then
                    edo_fut <= q4;
                else
                    edo_fut <= q2;
                end if;

            when q2 =>
                if a = '0' then
                    s <= '0';
                    edo_fut <= q4;
                else
                    s <= '1';
                    edo_fut <= q3;
                end if;

            when q3 =>
                s <= '0';
                if a = '0' then
                    edo_fut <= q3;
                else
                    edo_fut <= q3;
                end if;

            when q4 =>
                s <= '0';
                if a = '0' then
                    edo_fut <= q4;
                else
                    edo_fut <= q1;
                end if;
        end case;
    end process;

    Avance_Maquina : process(clk)
    begin
        if rising_edge(clk) then
            edo_pres <= edo_fut;
        end if;
    end process Avance_Maquina;
end rtl;
------------------------------------------------------------------------------------