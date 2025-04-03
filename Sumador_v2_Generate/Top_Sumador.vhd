library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Componentes.all;

entity Sumadores
    port 
    (
        A, B : in std_logic_Vector(23 downto 0);
        Z : out std_logic_vector(23 downto 0)
        C_out : out std_logic
    );
end Sumadores;

architecture rtl of ent is

    constant Tam_Sumador : integer := 32;

begin

    Sumador_nbits : Sumador
    generic map
    (
        nBits => Tam_Sumador
    )
    port map
    (
        A => A, B =>, C_in => C_in, Z => Z, C_out => Cout
    );

end rtl ; -- rtl