-----------------------------------------------------------------------------------
-- Procedimientos y Funciones
-- Diseñador: José de Jesús Morales Romero
-- Archivo: Ej_17_Proc_Func.vhd
-- Fecha: --/--/--
-- Versión: 1.0
-- Dependencias: Ninguna
-- Cambios: ----
------------------------------------------------------------------------------------

-- Una funci{on siempre devuelve un valor, mientras que un procedimiento solo puede devolver valores a través de los parámetros que se le pasen.
-- Los argumentos de una función son siempre de entrada, por lo que sólo se pueden leer dentro de una función. En el procedimiento pueden ser de entrada, salida o entrada/salida, por lo que pueden sufrir modificaciones.

-- Una función no tiene efectos "colaterales", pero un procedimiento si, es decir, puede provocar cambios en objetos a él debido a que se pueden cambiar las señales aunque no se hubieran especificado en el argumento. Es decir, en los procedimientos se pueden realizar asignaciones sobre señales declaradas en la arquitecrura y, por lo tanto, externas al procedimiento.

-- Las funciones, como devuelven un valor, se usan en expresiones, mientras que los procedimientos se llaman como una sentencia secuencial o concurrente.

-- La función debe contener la palabra clave Return seguida de una expresión puesto que siempre devuelve un valor, mientras que en el procedimiento no es necesario.

-- Una función jamás puede tener la instrucción Wait, mientras que un procedimiento si.

-- Revisar la función de las prácticas (Práctica 8)