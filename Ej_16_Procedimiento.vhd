-----------------------------------------------------------------------------------
-- Procedimientos
-- Diseñador: José de Jesús Morales Romero
-- Archivo: Ej_16_Procedimiento.vhd
-- Fecha: --/--/--
-- Versión: 1.0
-- Dependencias: Ninguna
-- Cambios: ----
------------------------------------------------------------------------------------

------------------------------------------------------------------------------------
-- El procedimiento sólo puede devolver valores a través de los parámetros que se le pasen. Los argumentos pueden ser, entonces, de entrada, de salida o bidireccionales.
-- Los procedimientos tienen efectos colaterales, es decir, pueden provocar cambios en señales o puertos externos a él. 
-- Los procedimientos pueden contener instrucciones Wait.

------------------------------------------------------------------------------------
-- Sintaxis
-- Procedure nombre_del_procedimiento [(parametros)] is
-- [declaraciones]
-- begin
--      [sentencias_serie]
-- end [Procedure] [nombre];
------------------------------------------------------------------------------------

-- Ejemplo de un procedimiento
-- Convertidor de un vector a entero

library ieee;
use ieee.std_logic_1164.all;

entity Procedimiento_Vec_2_Int is
    port
    (
        Vector_In : in std_logic_vector(5 downto 0);
        Entero_Out : out integer range 0 to 63
    );
end Procedimiento_Vec_2_Int;

architecture rtl of Procedimiento_Vec_2_Int is
begin
    process(Vector_In)
        variable temporal : integer range 0 to 63;
    begin
        Proc_Vec2Int(Vector_In, 6, temporal);
        Entero_Out <= temporal;
    end process;
end rtl;

procedure Proc_Vec2Int(vin : in std_logic_vector, nbits : in integer, salida : out integer)
    variable temp : integer range to 63;
begin
    temp := 0;
    for i in 0 to nbits - 1 loop
        if vin(i) = '1' then
            temp := temp + (2 ** i);
        end if;
    end loop;
    salida := temp;
end;
