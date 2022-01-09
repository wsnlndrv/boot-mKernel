Arranque y micro kernel en ensamblador, mas o menos una plantilla básica para aprender en casa.




Explicación resumida de algunos de los términos relativos al tema tratado.

; - El punto y coma es usado para los comentarios en este caso Nasm.
BIOS - Basic Input/Output System, en castellano sistema básico de entrada/salida, físicamente es un circuito integrado alojado en la placa base, el bios comprueba que el hardware está presente, además tiene algunas funciones internas que pueden ser llamadas usando interrupciones.
Código fuente - El código del programa escrito por un programador antes de su compilación, la extensión no es importante en este caso.
Codigo objeto - El código del objeto resultante después de  haber compilado el código fuente, normalmente usan extensión *.o
Enlazador o linker -  Es un programa que usa los objetos previamente compilados, gestiona recursos necesarios como las bibliotecas, quita los recursos innecesarios y al final enlaza el código objeto con las bibliotecas y termina generando el fichero ejecutable o biblioteca.
Pila o stack - Es una lista o estructura de datos en la que el modo de acceso a sus elementos es de tipo LIFO.
LIFO - Significa, ultimo en entrar y primero en salir y su función es la de almacenar y recuperar datos de pilas.
Interrupción - Se usan como ordenes internas para llamar a funciones o procedimientos del sistema enfocado en el manejo de hardware.
Hexadecimal - Sistema de numeración base16 muy usado en lo relativo al tema tratado.
Decimal - Sistema de numeración base10, el que hemos aprendido en las escuelas.
$ - Apunte directo hacia el inicio de una instrucción.
$$ - Apunte directo hacia el inicio de un programa.
bit - Puede ser un 1 o 0, la unidad mas pequeña usada en computación.
byte - Equivalente a un conjunto de 8 bit.
db - Pseudo instrucción usada para declarar un byte.
dw - Pseudo instrucción usada para declarar una palabra (Word), de  2 bytes, generalmente de un sistema x86.
dd - Pseudo instrucción usada para declarar una palabra doble, de 4 bytes, generalmente de un sistema x86.
ax - Acumulador
bx - Registro base
cx - Registro contador.
dx - Registro de datos
ds - Registro del segmento de datos.
es - Registro del segmento extra.
ss - Registro del segmento de pila.
cs - Registro del segmento de código.
si - Registro índice fuente.
bp - registro de apuntadores base.
di - Registro índice destino.
ip - Registro de apuntadores de la siguiente instrucción
sp - Registro de apuntador de la pila.
f - registro de banderas.
Instrucciones lógicas:

xor - Usado para realizar una disyunción lógica bit por bit entre dos operandos.
test - Usado para realizar una conjunción bit por bit enfocado a las banderas y al contrario que "and" que coloca el resultado en el operando de destino.
and - Usado para realizar una conjugación de operandos, bit por bit.
neg - Usado para generar el complemento de 2 del operador destino para almacenarlo en el mismo operando.
not - Usado para guardar el mismo operando destino.
or - Usado para la disyunción inclusiva y lógica de dos operandos, bit por bit.
 

Mas sobre este tema en:

 

http://www.osdever.net

https://es.wikipedia.org/wiki/Lenguaje_ensamblador#Uso_del_t.C3.A9rmino
# boot-mKernel
