------------------------------------------------------------------------------
-- Dise?ador: José de Jesús Morales Romero
-- VLSI-SEES-CINVESTAV-IPN
-- Receptor RS232
-- Velocidad: 115200 bauds
-- Descripción: Receptor de datos via RS232,
-- 8 bits de dato, 1 bit de stop
-- Versi?n: 2.0
------------------------------------------------------------------------------
-- Puertos
-- clk: 		Señal de reloj nMHz
-- rst: 		Reset general
-- rx:  		Entrada de recepción
-- ce_rx:		Bandera de recepción
-- inRS232:     Dato recibido
------------------------------------------------------------------------------
-- Banderas
--	ce_rx: '0' No esta recibiendo
--		   '1' Recibiendo datos
------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity RS232 is
	Port
    (	
        clk: in std_logic;
		rst: in std_logic;
		rx: in std_logic;
		edo_rx: out std_logic;
		dato: out std_logic_vector(7 downto 0)
	);
end RS232;

architecture arq_rxRS232 of RS232 is

    -- Se comprobaron las velocidades en TeraTerm
    -- Para 100MHz : 100MHz/(BaudRate) - 2
    --  (100MHz / 115200 bauds) - 2 = 866_10 = 1101100010_2 :> nBits = 10
	--  110000101 para 256000 bauds (totalmente funcional)
    -- Para 50MHz
    --  (50MHz / 115200 Bauds) - 2 = 432_10 = 110110000_2 :> nBits = 9
    -- Para 12MHz
    --  (12MHz / 115200 Bauds) - 2 = 102_10 = 1100110_2 :> mBtis = 7

	constant nBits : integer := 9;
    constant baudRx: std_logic_vector(nBits - 1 downto 0):= "110110000";
    signal contBaud: std_logic_vector(nBits - 1 downto 0):= (others => '0'); -- Contador de tiempo
    signal bitIndice: std_logic_vector(3 downto 0):= (others => '0');
    signal dato_t: std_logic_vector(7 downto 0):= (others => '0');

    type Estados is (Espera, BitInicio, ReiniciaCont, EsperaBaud, AlmacenaBit);
    signal Edo: Estados;

begin

    Maquina: process(clk, rst, Edo , rx, contBaud, bitIndice)
    begin
        if(rising_edge(clk))then
            if(rst = '1')then
                Edo <= Espera;
            else
                case Edo is
                    when Espera => -- Espera a que rx sea 0
                        if(rx = '1')then
                            Edo <= Espera;
                        else
                            Edo <= BitInicio;
                        end if;
                    when BitInicio => -- Espera la mitad de tiempo de contBaud
                        if(contBaud >= '0' & baudRx(nBits - 1 downto 1))then -- Espera la mitad de tiempo de baudRx
                            Edo <= ReiniciaCont;
                        else
                            Edo <= BitInicio;
                        end if;
                    when ReiniciaCont => -- Reinicia el contador de tiempo
                        Edo <= EsperaBaud;
                    when EsperaBaud => -- Espera a que contBaud cumpla su tiempo
                        if(contBaud >= baudRx)then
                            Edo <= AlmacenaBit;
                        else
                            Edo <= EsperaBaud;
                        end if;
                    when AlmacenaBit => -- Guarda el bit corrrespondiente
                        if(bitIndice >= "1000")then
                            Edo <= Espera;
                        else
                            Edo <= ReiniciaCont;
                        end if;
                end case;
            end if;
        end if;
    end process;

    ContadorTiempo: process(clk, Edo, contBaud)
    begin
        if(rising_edge(clk))then
            if(Edo = Espera or Edo = ReiniciaCont)then
                contBaud <= (others => '0');
            elsif(Edo = EsperaBaud or Edo = BitInicio)then
                contBaud <= contBaud + 1;
            else
                contBaud <= contBaud;
            end if;
        end if;
    end process;

    ContadorBits: process(clk, Edo, bitIndice)
    begin
        if(rising_edge(clk))then
            if(Edo = Espera)then
                bitIndice <= (others => '1');
            elsif(Edo = ReiniciaCont)then
                bitIndice <= bitIndice + 1;
            else
                bitIndice <= bitIndice;
            end if;
        end if;
    end process;

    GuardaDato: process(clk, Edo, bitIndice)
    begin
        if(rising_edge(clk))then
            if(Edo = AlmacenaBit)then
                if(bitIndice <= "0111")then
                    dato_t(CONV_INTEGER(bitIndice)) <= rx;
                else
                    dato_t <= dato_t;
                end if;
            else
                dato_t <= dato_t;
            end if;
        end if;
    end process;

    dato <= dato_t;
    
    edo_rx <= '1' when (Edo = Espera) else '0';

end arq_rxRS232;
