-----------------------------------------------------------------------------------
-- Simulación
-- Diseñador: José de Jesús Morales Romero
-- Archivo: Ej_19_Simulacion_02.vhd
-- Fecha: --/--/--
-- Versión: 1.0
-- Dependencias: Ninguna
-- Cambios: ----
------------------------------------------------------------------------------------

------------------------------------------------------------------------------------
-- El lenguaje VHDL sirve también para la descripción de modelos de simulación, sus
--      principales características son:
-- - No tiene demasiadas restricciones.
-- - Solo se requiere un interprete de las instrucciones.
-- - No importa el nivel de abstracción.

-- Hay una serie de elementos que solo tienen significado en un entorno de 
--      simulación, estos son:
-- - Especificiación de retardos.
-- - Notificaciión de sucesos.
-- - Descripción del banco de pruebas.
------------------------------------------------------------------------------------

------------------------------------------------------------------------------------
-- Banco de pruebas (Test Bench)
-- Un banco de pruebas no es más que la definición de un conjunto de entradas
--      llamadas patrones de prueba, con las que se verifica el funcionamiento del
--      circuito.
--
-- Funciones del banco de pruebas
-- El banco de pruebas se conecta con el componente a verificar mediante dos tipos
--      de señales:
-- - Estímulos
-- - Respuestas
-- Sus funciones son la generación de estímulos y el análisis de las respuestas.
--
--  -------------------------------------------------
-- | Sistema                                         |
-- |  ----------                     --------------  |
-- | | Banco de |--> Estímulos ---->| Componente a | |
-- | | pruebas  |<-- Respuestas <---| verificar    | |
-- |  ----------                     --------------  |
--  ------------------------------------------------- 
--
-- Estructura de un Banco de Pruebas
-- El banco de pruebas consta de una entidad sin puertos. La arquitectura es de tipo
--      estructura, tiene como señales internas las entradas y salidas del circuito,
--      el único llamado a componente es el correspondiente a la entidad que se
--      desea simular y por último una sección de estímulos

entity TB is
end TB;

architecture TB_arq of TB is
    -- señales ...
begin
    UUT : entidad_a_Simular is
    port map();
    
    stimuli : process
    begin
        asignacion_seniales;
        wait for ...
        wait;
    end process stimuli;
end TB_arq;
------------------------------------------------------------------------------------

------------------------------------------------------------------------------------
-- Especificación de retardos:
-- Para indicar un retardo en las asignaciones se emplea la palabra AFTER.
senial <= '0' after 15 ns;
-- Cuando se le asigna un valor a una señal, no se le asigna de forma inmediata,
--      sino que se le asigna a su fuente (driver).
sennial <= '1' after 20 ns, '0' after 10 ns;
------------------------------------------------------------------------------------

------------------------------------------------------------------------------------
-- Notificaciones de sucesos
-- Durante la simulación de un circuito en VHDL, se pueden notificar ciertos
--      sucesos mediante la utilización de la palabra clave ASSERT, que tiene como
--      elemento de activación una condición.
ASSERT condicion REPORT mensaje SEVERITY nivel_gravedad
-- Si no se cumple la condición especificada entonces se saca el mensaje
--      especificado por pantalla y se da además un nivel de gravedad. Tanto el
--      mensaje como el nivel de gravedad son opcionales.
-- Si no se especifica ningún mensaje aparece la cadena "Assertion Violation".
-- Los niveles de gravedad que hay son: NOTE, WARNING, ERROR y Failure, y si no se
--      especifica nada, el valor por defecto es ERROR.
------------------------------------------------------------------------------------

------------------------------------------------------------------------------------
-- Condición WAIT
-- La condición WAIT es utilizada para detener un proceso (process)
-- Existen tres tipos de WAIT
-- wait for tipo_expresion. Espera por algún lapso de tiempo:
wait for 10 ns;
wait for periodo / 2;
-- wait until condicion. Espera hasta que la condición booleana se cumpla:
wait until A and B;
wait until clk = '1';
-- wait on lista_sensitiva. Espera por un cambio de valor de la señal:
wait on clk;
wait on enebale_data;
-- Se pueden realizar condiciones complejas, combinando las diferentes formas
--      anteriores. 
wait on a, b until (a = '1' and b + '0') for 10 ns;
------------------------------------------------------------------------------------

------------------------------------------------------------------------------------
-- Metodologías para un banco de pruebas
-- La construcción de un banco de pruebas para un circuito determinado puede
--      abordarse de distintanas maneras. Según la forma de generación de los 
--      vectores de prueba, estas metodologías se pueden clasificar en:
-- - Método tabular
-- - Utilización de archivos
-- - Metodología algorítmica
------------------------------------------------------------------------------------

-- Ejemplo. EPM240_PWM.vhd