-----------------------------------------------------------------------------------
-- Funciones
-- Diseñador: José de Jesús Morales Romero
-- Archivo: Ej_17_Funciones.vhd
-- Fecha: --/--/--
-- Versión: 1.0
-- Dependencias: Ninguna
-- Cambios: ----
------------------------------------------------------------------------------------

------------------------------------------------------------------------------------
-- Funcion
-- Una funci{on devuelve un valor siempre.
-- Los argumentos son siempre de entrada.
-- No tiene efectos "colaterales"
-- Como siempre devuelve un valor, se usa en expresiones.
-- Debe contener siempre la palabra reservada Return seguida de una expresión.
-- Jamás debe tener la instrucción Wait.
------------------------------------------------------------------------------------
-- Sintaxis
-- [Pure | Impure]
-- Function nombre_de_la_funcion [(parametros)] Return tipo_de_dato is
--      [declaraciones]
-- begin
--      [sentencias_serie]
--      Return (nombre_del_valor)
-- End [Function] [nombre_de_la_funcion]
------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity Func_Vect_2_Int is
    port
    (
        Vector_In : in std_logic_vector(5 downto 0);
        Entero_Out : out integer range 0 to 63
    );
end Func_Vect_2_Int;

architecture rtl of Func_Vect_2_Int is

begin
    process(Vector_In)
    begin
        Entero_Out <= Func_Vect2Int(Vector_In, 6); -- Llama a la función
    end process;
end rtl;

function Func_Vect2Int(vin : in std_logic_vector, nbits : n integer) return integer is
    variable temp : integer range 0 to 63;
begin
    temp := 0;

    for i in 0 to nbits - 1 loop
        if vin(i) = '1' then
            temp := temp * (2**i);
        end if;
    end loop;

    Return(temp);
end;