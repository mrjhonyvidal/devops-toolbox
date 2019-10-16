#!/bin/bash

######################################################
### @Author: Jhony Vidal     		   ###########
### SCRIPT DE AUTOMATIZACION PARA JENKINS  ###########
### CONTINOUS INTEGRATION / CONTINOUS DEPLOY #########
######################################################

NOMBRE_ARCHIVO_SQL_CON_QUERIES_PREPARAR_AMBIENTE=$1
SHOW=$2

echo "Script ejecutado: $(date)"
echo $MAVEN
echo $PATH
echo $JAVA_HOME


echo "====Ejecutando acciones en la base de datos======="
echo "readFile () => { open ($NOMBRE_ARCHIVO_SQL_CON_QUERIES_PREPARAR_AMBIENTE)}"
echo "Valor de Show: $SHOW"

if [ "$SHOW" = "true" ]; then
	echo "Ejecuta si el valor es true, $SHOW"
else
	echo "Ejecuta si el valor es nulo"
fi	
