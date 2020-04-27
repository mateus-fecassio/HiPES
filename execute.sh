#!/bin/bash

#número de repetições
repetitions="10"

#início
INIT=1

#fim
END=256


cd vectorSum1
make

#MEDIÇÃO DE TEMPO
echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA vectorSum1 (base)..."
for ((size=INIT; size<=END; size++)) ; 
	do
		echo "$size (MBytes) done"
		./vectorSum -d $size -r $repetitions >> temp.tmp
	done
mv ./temp.tmp ../base.tmp
make purge




cd ..
cd vectorSum2
make

#MEDIÇÃO DE TEMPO
echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA vectorSum2 (vetorizado)..."
for size in {1..256} ; 
	do
		echo "$size (MBytes) done"
		./vectorSum -d $size -r $repetitions >> temp.tmp
	done
mv ./temp.tmp ../vetorizado.tmp
make purge




cd ..
cd vectorSum3
make

#MEDIÇÃO DE TEMPO
echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA vectorSum3 (vetorizado e nt load)..."
for size in {1..256} ; 
	do
		echo "$size (MBytes) done"
		./vectorSum -d $size -r $repetitions >> temp.tmp
	done
mv ./temp.tmp ../vetorizado_nt_load.tmp
make purge
