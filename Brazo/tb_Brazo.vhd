library ieee;
use ieee.std_logic_1164.all;

entity tb_Brazo is
end tb_Brazo;

architecture rtl of tb_Brazo is

    component Brazo is
        port
        (
            clk_50MHz : in std_logic;
            rst : in std_logic;
            val_PWM_1: in std_logic_vector(5 downto 0);
            val_PWM_2: in std_logic_vector(5 downto 0);
            val_PWM_3: in std_logic_vector(5 downto 0);
            val_PWM_4: in std_logic_vector(5 downto 0);
            PWM_1 : out std_logic;
            PWM_2 : out std_logic;
            PWM_3 : out std_logic;
            PWM_4 : out std_logic
        );
    end component;

    signal clk_50MHz : std_logic := '0';
    signal val_PWM_1 : std_logic_vector(5 downto 0);
    signal val_PWM_2 : std_logic_vector(5 downto 0);
    signal val_PWM_3 : std_logic_vector(5 downto 0);
    signal val_PWM_4 : std_logic_vector(5 downto 0);
    signal rst : std_logic := '0';
    signal PWM_1 : std_logic;
    signal PWM_2 : std_logic;
    signal PWM_3 : std_logic;
    signal PWM_4 : std_logic;

    constant periodo : time := 20 ns;

begin

    uut : Brazo
    port map
    (
        clk_50MHz => clk_50MHz, rst => rst, 
        val_PWM_1 => val_PWM_1, val_PWM_2 => val_PWM_2, val_PWM_3 => val_PWM_3, val_PWM_4 => val_PWM_4,
        PWM_1 => PWM_1, PWM_2 => PWM_2, PWM_3 => PWM_3, PWM_4 => PWM_4
    );

    clk : process
    begin
        clk_50MHz <= '0';
        wait for periodo / 2;
        clk_50MHz <= '1';
        wait for periodo / 2;
    end process;

    stim : process
    begin
        wait for 20 ns;
        val_PWM_1 <= "01" & X"9";
        val_PWM_2 <= "01" & X"F";
        val_PWM_3 <= "10" & X"5";
        val_PWM_4 <= "10" & X"B";
        rst <= '0';
        wait;
    end process;

end rtl ; -- rtl