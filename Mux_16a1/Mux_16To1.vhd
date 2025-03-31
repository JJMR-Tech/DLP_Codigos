---------------------------------------------------------------------------------------
-- Autor: José de Jesús Morales Romero
-- Diseño: Multplixor de 16 a 1
-- Fecha: --/--/----
-- Cambios: --
-- Versión: 1.0
-- Comentarios: Multiplexor 16:1, realizado con multiplexores 4:1, utilizando la 
-- técnica de Estructuras de Repetición
---------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Componentes.all;

entity Mux_16To1 is
    port
    (
        Datos : in std_logic_vector(0 to 15);
        selector : in std_logic_vector(3 downto 0);
        Salida : out std_logic
    );
end Mux_16To1;

architecture rtl of Mux_16To1 is

    signal m : std_logic_vector(0 to 3); -- Señal temporal de las salidas de los primeros multiplexores
begin
    Muxtiplexor : for i in 0 to 3 generate
        Muxes : Mux_4a1 
            port map
            (
                -- Entradas
                Datos(4 * i), Datos(4 * i + 1), Datos(4 * i + 2), Datos(4 * i + 3), selector(1 downto 0),
                -- Salidas
                m(i)
            );
    end generate;

    mux4 : mux_4a1
        port map
        (
            m(0), m(1), m(2), m(3), selector(3 downto 2),
            Salida
        );

end rtl;