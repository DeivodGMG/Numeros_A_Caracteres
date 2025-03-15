#!/bin/bash
clear # LIMPIA LA CONSOLA :)

# Unidades
unidades=("cero" "uno" "dos" "tres" "cuatro" "cinco" "seis" "siete" "ocho" "nueve")
# Dieces..
dieces=("diez" "once" "doce" "trece" "catorce" "quince" "dieciséis" "diecisiete" "dieciocho" "diecinueve")
# Decenas
decenas=("" "diez" "veinte" "treinta" "cuarenta" "cincuenta" "sesenta" "setenta" "ochenta" "noventa")
# Centenas
centenas=("" "cien" "doscientos" "trescientos" "cuatrocientos" "quinientos" "seiscientos" "setecientos" "ochocientos" "novecientos")
# Miles y millones pa
miles=("mil" "un millón" "millones")

convertir_a_texto() {
    local num=$1
    local texto=""
    if (( num == 0 )); then
        echo "cero"
        return
    fi
    if (( num >= 1000000 )); then
        millones=$(( num / 1000000 ))
        if (( millones == 1 )); then
            texto+="un millón "
        else
            texto+="$(convertir_a_texto $millones) millones "
        fi
        num=$(( num % 1000000 ))
    fi

    if (( num >= 1000 )); then
        miles_num=$(( num / 1000 ))
        if (( miles_num == 1 )); then
            texto+="mil "
        else
            texto+="$(convertir_a_texto $miles_num) mil "
        fi
        num=$(( num % 1000 ))
    fi

    if (( num >= 100 )); then
        centenas_num=$(( num / 100 ))
        if (( centenas_num == 1 && num % 100 != 0 )); then
            texto+="ciento "
        else
            texto+="${centenas[centenas_num]} "
        fi
        num=$(( num % 100 ))
    fi

    if (( num >= 20 )); then
        decenas_num=$(( num / 10 ))
        texto+="${decenas[decenas_num]} "
        num=$(( num % 10 ))
    fi

    if (( num >= 10 )); then
        texto+="${dieces[num-10]} "
        num=0
    fi

    if (( num > 0 )); then
        texto+="${unidades[num]} "
    fi

    echo "$texto"
}

echo "** DE NUMEROS A CARACTERES **"
echo "Ingrese un numero:"
read number

if ! [[ "$number" =~ ^[0-9]+$ ]] || (( number > 3000000 )); then
    echo "Please, ingrese un número válido entre 0 y 3000000 :v."
else
    resultado=$(convertir_a_texto $number)
    echo "El número $number en texto es: $resultado"
fi