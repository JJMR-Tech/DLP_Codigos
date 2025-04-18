------------------------------------------------------------------------------------
-- Enunciado Proceso
-- Diseñador: José de Jesús Morales Romero
-- Archivo: Ej_04_Proceso
-- Fecha: --/--/--
-- Versión: 1.0
-- Dependencias: Ninguna
-- Cambios: ----
------------------------------------------------------------------------------------
-- Tipos de enunciados concurrentes
--      Asignación de señales: Permite asignar un valor calculado a una señal o puerto.
--      Procesos (process): Permite definir un algoritmo secuencial que lee valores de
--                          señales y calcula nuevos valores que son asignados a otras
--                          señales.
--      Bloque (block)
--      Llamada a un componente predefinido
--      Llama a un subprograma
------------------------------------------------------------------------------------
-- Cada aproceso es conformado por un conjunto de enunciados secuenciales.
-- Los enunciados secuenciales son interpretados por la herramienta de síntesis en forma
--      secuencial, es decir, uno por uno; por lo que el orden en el cual son 
--      declarados tiene un efecto significativo en la lógica que se intenta
--      describir o sintetizar.
-- Enunciados secuenciales
--      -- if
--      -- case
--      -- loop
--      -- next
--      -- exit
--      -- Enunciados de Subproramas
--      -- return
--      -- wait
--      -- null
------------------------------------------------------------------------------------
-- Una señal que se vea involucrada dentro de un proceso no recibe inmediatamente el
--      valor asignado, sólo hasta el final del mismo. Una variable que sea 
--      utilizada dentro de un proceso sí recibe el valor de forma inmediata.
------------------------------------------------------------------------------------
-- Construcción de un proceso:
--
Etiqueta : process(lista_sensitiva)
begin
    Enunciados_secuenciales;
end process Etiqueta;
------------------------------------------------------------------------------------