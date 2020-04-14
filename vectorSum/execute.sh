#!/bin/bash

#Número de repetições
repetitions="10"

#Escala de valores em x
x_range="[10:10000]"

#Resolução de saída dos gráficos gerados pelo gnuplot.
image_size="1600,900" #1600x900

	
#MEDIÇÃO DE TEMPO
echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO ..."
for size in {1..10} ; 
	do
		./vectorSum -d $size -r $repetitions >> $temp.tmp
	done
		
	gnuplot <<- EOF
	reset
	set terminal png size ${image_size} enhanced font 'Verdana,12' 
	set style data linespoints
	set style fill solid 2.00 border 0
	
	set style line 1 lc rgb 'orange' lt 1 lw 2 pt 13 ps 1.0
	set style line 2 lc rgb 'red' lt 1 lw 2 pt 7 ps 1.0
	set style line 3 lc rgb 'grey' lt 1 lw 2 pt 13 ps 1.0
	
	set key font ",10" 
	set key horizontal  
	set key spacing 3 
	set key samplen 3 
	set key width 2
	set title 'Medição de desempenho para SOMAS VETORIAIS' font ",16" 
	set xrange ${x_range}
	set logscale x
	set logscale y
	set xlabel "tamanho dos vetores (MBytes)" 
	set xlabel font ",13" 
	set ylabel "milissegundos (ms)" 
	set ylabel font ",13"
	
	set output "grafico.png"
	plot 'temp.tmp' using 1:2 with linespoints ls 1 title "soma vetorial básica", \
	'temp.tmp' using 1:3 with linespoints ls 2 title "vetorização", \
	'temp.tmp' using 1:4 with linespoints ls 3 title "vetorização e load atemporal"
EOF
		
		