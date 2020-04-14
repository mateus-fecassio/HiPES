#!/bin/bash

#Tamanho máximo de valores
MAX="10"

#Número de repetições
repetitions="10"

#Escala de valores em x
x_range="[10:10000]"

#Resolução de saída dos gráficos gerados pelo gnuplot.
image_size="1600,900" #1600x900

	
#MEDIÇÃO DE TEMPO
echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO ..."
for size in {1..$MAX} ; 
	do
		echo "$size / $MAX (MBytes) done"
		./vectorSum -d $size -r $repetitions >> temp.tmp
	done		