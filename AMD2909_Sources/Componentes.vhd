library ieee;
use ieee.std_logic_1164.all;

package Componentes is
    component Registro
        port
        (
            R : in std_logic_vector(3 downto 0);
            ER, clk : in std_logic;
            Reg : inout std_logic_vector(3 downto 0)
        );
    end component;

    component Mux_4
        port
        (
            D, R, ST, PC : in std_logic_vector(3 downto 0);
            S : in std_logic_vector(1 downto 0);
            Y : inout std_logic_vector(3 downto 0)
        );
    end component;

    component MPC
        port
        (
            Cin, clk : in std_logic;
            Y : in std_logic_vector(3 downto 0);
            Cout : out std_logic;
            PC : inout std_logic_vector(3 downto 0)
        );
    end component;

    component Stack
        port
        (
            clk, FE, Push_Pop : in std_logic;
            PC : in std_logic_vector(3 downto 0);
            ST : inout std_logic_vector(3 downto 0)
        );
    end component;
end package ;