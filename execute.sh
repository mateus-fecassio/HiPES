#!/bin/bash

#número de repetições
repetitions="10"

#início
INIT=1

#fim
END=100

#------------------------------------------------------------------128
cd 128
cd vectorSum1
make

echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA vectorSum1 (base)..."
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		./vectorSum -d $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > base.tmp
mv ./base.tmp ../base.csv
make purge


cd ..
cd vectorSum2
make

echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA vectorSum2 (vetorizado)..."
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		./vectorSum -d $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > vect.tmp
mv ./vect.tmp ../vetorizado.csv
make purge


cd ..
cd vectorSum3
make

echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA vectorSum3 (vetorizado e nt load)..."
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		./vectorSum -d $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > vectnt.tmp
mv ./vectnt.tmp ../vetorizado_nt_load.csv
make purge
#---------------------------------------------------------------------

#------------------------------------------------------------------256
cd ../..
cd 256
cd vectorSum1
make

echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA vectorSum1 (base)..."
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		./vectorSum -d $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > base.tmp
mv ./base.tmp ../base.csv
make purge


cd ..
cd vectorSum2
make

echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA vectorSum2 (vetorizado)..."
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		./vectorSum -d $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > vect.tmp
mv ./vect.tmp ../vetorizado.csv
make purge


cd ..
cd vectorSum3
make

echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA vectorSum3 (vetorizado e nt load)..."
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		./vectorSum -d $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > vectnt.tmp
mv ./vectnt.tmp ../vetorizado_nt_load.csv
make purge
#---------------------------------------------------------------------


#------------------------------------------------------------------512
cd ../..
cd 512
cd vectorSum1
make

echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA vectorSum1 (base)..."
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		./vectorSum -d $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > base.tmp
mv ./base.tmp ../base.csv
make purge


cd ..
cd vectorSum2
make

echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA vectorSum2 (vetorizado)..."
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		./vectorSum -d $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > vect.tmp
mv ./vect.tmp ../vetorizado.csv
make purge


cd ..
cd vectorSum3
make

echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA vectorSum3 (vetorizado e nt load)..."
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		./vectorSum -d $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > vectnt.tmp
mv ./vectnt.tmp ../vetorizado_nt_load.csv
make purge
#---------------------------------------------------------------------

echo "TODOS OS TESTES FORAM CONCLUÍDOS COM SUCESSO!"
