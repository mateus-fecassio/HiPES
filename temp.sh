#!/bin/bash


#número de repetições
repetitions="10"

#início
INIT=1

#fim
END=100

flags='L1-dcache-loads,L1-dcache-load-misses,L1-dcache-stores,L1-icache-load-misses,LLC-loads,LLC-load-misses,LLC-stores,LLC-store-misses'

leng=1023

value=128

date >> time.txt


#------------------------------------------------------------------
test='TESTE3'
#------------------------------------------------------------------
#---------------------128
cd 1-vectorSum
cd 128
make 2> makefile.txt

echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA vectorSum (normal)... ---128"
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		./vectorSum -m WB -d NULL -o normal -s $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > base.tmp
mv ./base.tmp ../../RESULTADOS/$test/128-normal.csv

echo "REALIZANDO O TESTE DE MEDIÇÃO COM PERF PARA vectorSum (normal)... ---128"
for ((size=INIT; size<=END; size++)) ; 
	do
		perf stat -e $flags ./vectorSum -m WB -d NULL -o normal -s $size -r $repetitions 2>> temporary.tmp
		printf "$(grep ',' temp.tmp  | tr ',' '.')\n" > temporary.tmp
		mv ./temporary.tmp ../../RESULTADOS/$test/perf/128-normal_$size.txt
	done







echo "TODOS OS TESTES FORAM CONCLUÍDOS COM SUCESSO!"
