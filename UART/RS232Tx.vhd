------------------------------------------------------------------------------
-- Diseñador: José de Jesús Morales Romero
-- Receptor RS232
-- Velocidad: 115200 bauds
-- Descripción: Transmisor de datos vía RS232,
-- 8 bits de dato, 1 bit de stop
-- Versión: 2.0
------------------------------------------------------------------------------
-- Puertos
-- clk: 		Señal de reloj 100MHz
-- tx:  		Salida de transmisión
-- edo_tx:	Bandera de recepción
-- dato: 	Dato enviado
------------------------------------------------------------------------------
-- Banderas
--	edo_tx: '1' No esta transmitiendo
--		     '0' Transmitiendo datos
------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity RS232Tx is
	generic
	(
		nBitsDatoRx: integer:= 8
	);
	Port 
	( 
		-- Señales de entrada
		clk: in std_logic;
		en: in std_logic;
		dato: in std_logic_vector(nBitsDatoRx - 1 downto 0);
		-- Señales de salida
		tx: out std_logic;
		edo_tx: out std_logic
	);
end RS232Tx;

architecture Behavioral of RS232Tx is

	-- Para f = 100MHz
	-- 	(round(100MHz / 9600 Bauds)) - 1 = 10416_10 = 110000110_2
	--		(round(100MHz / 115200 Bauds)) - 1 = 867_10 = 1101100011_2 :> nBitsTiempo = 10
	-- Para f = 50MHz
	--		round(50MHz / 115200 Bauds) - 1 = 433 = 110110001_2 :> nBitsTiempo = 9
	-- Para f = 12MHz
	-- 	(round(100MHz / 115200 Bauds)) - 1 = 103_10 = 1100111_2 :> nBitsTiempo = 7

	constant nBitsTiempo: integer:= 7;
	constant baudTx: std_logic_vector(nBitsTiempo - 1 downto 0):= "1100111";
	signal contBaud: unsigned(nBitsTiempo - 1 downto 0):= (others => '0');
	constant bit_indice : natural := 9;
	signal contIndice: natural;
	signal dato_tx: std_logic_vector(nBitsDatoRx + 1 downto 0);
	signal txBit: std_logic:= '1';

	type Estados is (Espera, EnviaBit, CompruebaBits);
	signal Edo: Estados;

begin

	Maquina: process(clk, en, Edo)
	begin
		if(rising_edge(clk))then
			case Edo is
				when Espera => 
					if(en = '0')then
						Edo <= Espera;
					else
						Edo <= EnviaBit;
					end if;
				when EnviaBit =>
					if(contBaud >= unsigned(baudTx) - 1)then
						Edo <= CompruebaBits;
					else
						Edo <= EnviaBit;
					end if;
				when CompruebaBits =>
					if(contIndice >= bit_indice)then
						Edo <= Espera;
					else
						Edo <= EnviaBit;
					end if;
			end case;
		end if;
	end process;

	ContadorDeTiempo: process(clk, Edo, contBaud)
	begin
		if(rising_edge(clk))then
			if(Edo = EnviaBit)then
				contBaud <= contBaud + 1;
			else
				contBaud <= (others => '0');
			end if;
		end if;
	end process;

	ContadorDeIndice: process(clk, Edo, contIndice)
	begin
		if(rising_edge(clk))then
			if(Edo = Espera)then
				contIndice <= 0;
			elsif(Edo = CompruebaBits)then
				contIndice <= contIndice + 1;
			else
				contIndice <= contIndice;
			end if;
		end if;
	end process;

	--          Bit Stop
	--          |      Dato a enviar
	--          |      |     Bit Start
	--          |      |     |
	dato_tx <= '1' & dato & '0';

	EnviaBitTx: process(clk, Edo)
	begin
		if(rising_edge(clk))then
			if(Edo = Espera)then
				tx <= '1';
			else
				tx <= dato_tx(contIndice);
			end if;
		end if;
	end process;

	edo_tx <= '1' when (Edo = Espera) else '0';

end Behavioral;

