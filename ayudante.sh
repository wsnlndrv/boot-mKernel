#!/bin/bash
# Ayudante para la compilación del archivo boot.asm y kernel.asm, especialmente programado para vagos, =D

ARCHIVO1=boot.asm
ARCHIVO2=kernel.asm
ARCHIVO3=boot.bin
ARCHIVO4=arranque.img
ARCHIVO5=kernel.bin

function titulo(){
	echo -e "\e[1;33m ۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞\e[0m"
	echo -e "\e[1;32m 	     Ayudante para vagos.\e[0m"
	echo -e "\e[1;33m ۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞\e[0m"
}

function snasm(){
	if [ -x /usr/bin/nasm ] || [ -x /usr/sbin/nasm ]; 
		then
		echo -e "\e[1;32m Comprobando la existencia de Nasm...  OK.\e[0m"
	else
		echo -e "\e[1;31m ERROR - El compilador 'Nasm' no está instalado, '¿pacman -S nasm?'.\e[0m"
		sleep 6
		exit 1;
	fi
}

function compilar(){
	echo -ne -e "\e[1;32m Se inicia la compilación de '$ARCHIVO1' y '$ARCHIVO2'...\r\e[0m"
	echo -ne '\n'
   	nasm boot.asm -f bin -o boot.bin
	sleep 2
	echo -ne -e "\e[1;32m $ARCHIVO1 compilado!\r\e[0m"
	echo -ne '\n'
	sleep 1
		nasm kernel.asm -f bin -o kernel.bin
	sleep 2
	echo -ne -e "\e[1;32m $ARCHIVO2 compilado!\r\e[0m"
	echo -ne '\n'
}

function montar(){
		dd if=boot.bin of=arranque.img count=1 seek=0
	echo -ne -e "\e[1;32m $ARCHIVO3 montado en $ARCHIVO4\r\e[0m"
	echo -ne '\n'
		dd if=kernel.bin of=arranque.img bs=512 count=1 seek=1
	echo -ne -e "\e[1;32m $ARCHIVO5 montado en $ARCHIVO4\r\e[0m"
	echo -ne '\n'
}

function comprobar(){
   if [ -f $ARCHIVO3 ];
   then
		rm boot.img
		echo -ne -e "\e[1;32m Eliminamos el archivo $ARCHIVO3...\r\e[0m"
		echo -ne '\n'
		sleep 1
		compilar
   else
		compilar		  		
	fi
}

function comprobardd(){
   if [ -f $ARCHIVO3  ] || [ -f $ARCHIVO5 ]; 
		then
		montar
		sleep 2
		limpieza
	else
		echo -e "\e[1;31m ERROR - No se encontro los archivos $ARCHIVO3 y $ARCHIVO5 para su ensamblado.\e[0m"
		sleep 5
		exit 1;
	fi
}

function limpieza(){
	 if [ -f $ARCHIVO3  ] || [ -f $ARCHIVO5 ]; 
		then
		rm $ARCHIVO3
		rm $ARCHIVO5
		echo -e "\e[1;32m Limpieza de archivos compilados... OK\e[0m"
	else
		echo -e "\e[1;31m ERROR - No se encontro los archivos $ARCHIVO3 y $ARCHIVO5 para su limpieza.\e[0m"
		sleep 5
		exit 1;
	fi
}

# Esta funcion a continuación no es necesaria para nada, es solo para practicar un poco de bash, que buena falta me hace! =)
function bp(){
		echo -ne -e "\e[1;32m (10%)\r\e[0m"
		sleep 0.1
		echo -ne -e "\e[1;32m (20%)\r\e[0m"
		sleep 0.1
		echo -ne -e "\e[1;32m (30%)\r\e[0m"
		sleep 0.1
		echo -ne -e "\e[1;32m (40%)\r\e[0m"
		sleep 0.1
		echo -ne -e "\e[1;32m (50%)\r\e[0m"
		sleep 0.1
		echo -ne -e "\e[1;32m (60%)\r\e[0m"
		sleep 0.1
		echo -ne -e "\e[1;32m (70%)\r\e[0m"
		sleep 0.1
   	echo -ne -e "\e[1;32m (80%)\r\e[0m"
		sleep 0.1
   	echo -ne -e "\e[1;32m (90%)\r\e[0m"
		sleep 0.1
   	echo -ne -e "\e[1;32m (100%)\r\e[0m"
		sleep 0.1
		echo -ne -e "\e[1;32m Completo!\r\e[0m"
		sleep 2 # Dos segundos para cerrar.
   	echo -ne '\n'	
		echo -ne -e "\e[1;32m Presiona una tecla para continuar!\r\e[0m"
}
while :
 do
	clear
	titulo
	echo "  [1] Compilar y ensamblar imagen."
	echo "  [2] Cargar imagen en QEmu."
	echo "  [3] Cerrar/Salir"
	echo -e "\e[1;33m ۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞۞\e[0m" 
	echo
	echo -n " Escoge una opción [1-3]: "
	read uioy
	case $uioy in
      1)  snasm; comprobar; comprobardd; bp; read ;;
      2) qemu-system-i386 arranque.img; read ;;
      3) exit 0 ;;
      *) echo " Solo tienes tres opciones!";
         echo " Presiona una tecla para continuar" ; read ;;
 esac
done
	exit
