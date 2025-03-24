------------------------------------------------------------------------------------
-- Secuenciador AMD2909
-- Diseñador: José de Jesús Morales Romero
-- Archivo: AMD2909.vhd
-- Fecha: --/--/--
-- Versión: 1.0
-- Dependencias: Ninguna
-- Cambios: ----
------------------------------------------------------------------------------------

------------------------------------------------------------------------------------
-- Secuenciador AMD 2909
-- Realizar la descripción del CI AM2909
--
--            --------
-- R[3..0] ->|        |<- Vcc
-- D[3..0] ->| AMD    |<- GND
--           | 2909   |
-- S[1..0] ->|        |-> Y[3..0]
--           |        |<- Push/POP
--           |        |<- OE
--           |        |<- CIN
--           |        |<- ER
--           |        |<- FE
--            --------

-- Terminales                     Función
-- Entradas por Registro R3 - R0  A través de ellas se permite sostener (hold) una dirección
-- Entradas Directas D3 - D0      Entradas del Secuenciador que permiten realizar un cambio de dirección en la lógica del programa
-- Entrada ER                     Habilitación del Registro R
-- Entrada FE                     Habilitación del apuntador de pila (Stack Pointer: ST)
-- Entrada CIN                    Acarreo de Entrada
-- Entrada OE                     Habilitación de Salidas
-- Entrada Push/POP               Control de Direccionamiento de Subrutinas
-- Entrada S1 - S0                Líneas de Selección
-- Salidas Y3 - Y0                Salidas del Secuenciador
-- Salida Cout                    Acarreo de Salida
-- Vcc y Gnd                      Alimentación del circuito
------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Componentes.all;

entity AMD2909 is
    port
    (
        clk : in std_logic;
        R : in std_logic_vector(3 downto 0);
        D : in std_logic_vector(3 downto 0);
        ER : in std_logic;
        S : in std_logic_vector(1 downto 0);
        FE : in std_logic;
        Push_Pop : in std_logic;
        Cin : in std_logic;
        Cout : out std_logic;
        Y : inout std_logic_vector(3 downto 0)
    );
end AMD2909;

architecture arq_AMD2909 of AMD2909 is
    signal REG : std_logic_vector(3 downto 0);
    signal ST : std_logic_vector(3 downto 0);
    signal PC : std_logic_vector(3 downto 0);
begin
    U1 : registro port map(clk => clk, ER => ER, REG => REG, R => R);

    U2 : MPC port map(Cin => Cin, Cout => Cout, clk => clk, Y => Y, PC => PC);

    U3 : Stack port map(clk => clk, FE => FE, Push_Pop => Push_Pop, PC => PC, ST => ST);

    U4 : Mux_4 
        port map(D => D, R => Reg, ST => ST, PC => PC, S => S, Y => Y);
end arq_AMD2909;