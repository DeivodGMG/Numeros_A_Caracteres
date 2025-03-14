#!/bin/bash

nombre_de_la_funcion() {
    if [[ $1 == 1 ]]; then
        #statements
    fi
  
}

# Llamar a la función
nombre_de_la_funcion


# Unidades
unidades=("cero" "uno" "dos" "tres" "cuatro" "cinco" "seis" "siete" "ocho" "nueve")
# Dieces especiales
dieces=("diez" "once" "doce" "trece" "catorce" "quince" "dieciséis" "diecisiete" "dieciocho" "diecinueve")
# Decenas
decenas=("" "diez" "veinte" "treinta" "cuarenta" "cincuenta" "sesenta" "setenta" "ochenta" "noventa")
# Centenas
centenas=("" "cien" "doscientos" "trescientos" "cuatrocientos" "quinientos" "seiscientos" "setecientos" "ochocientos" "novecientos")
# Miles y millones
miles=("mil" "un millón" "millones")
echo "** DE NUMEROS A CARACTERES **"
echo "Ingrese un numero:"
read number
nombre_de_la_funcion
