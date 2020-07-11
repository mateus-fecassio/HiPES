#!/bin/bash


#número de repetições
repetitions="10"

#início
INIT=1

#fim
END=100


#------------------------------------------------------------------
test='TESTE1'
#------------------------------------------------------------------
#---------------------128
cd 1-vectorSum
cd 128
make

echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA vectorSum (normal)..."
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		./vectorSum -m WB -d NULL -o normal -s $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > base.tmp
mv ./base.tmp ../../RESULTADOS/$test/128-normal.csv


echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA vectorSum (vetorizado)..."
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		./vectorSum -m WB -d NULL -o vectorizing -s $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > base.tmp
mv ./base.tmp ../../RESULTADOS/$test/128-vectorizing.csv


echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA vectorSum (non-temporal load)..."
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		./vectorSum -m WB -d NULL -o nt_load -s $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > base.tmp
mv ./base.tmp ../../RESULTADOS/$test/128-nt_load.csv

make purge



#---------------------256
cd ../256
make

echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA vectorSum (normal)..."
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		./vectorSum -m WB -d NULL -o normal -s $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > base.tmp
mv ./base.tmp ../../RESULTADOS/$test/256-normal.csv


echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA vectorSum (vetorizado)..."
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		./vectorSum -m WB -d NULL -o vectorizing -s $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > base.tmp
mv ./base.tmp ../../RESULTADOS/$test/256-vectorizing.csv


echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA vectorSum (non-temporal load)..."
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		./vectorSum -m WB -d NULL -o nt_load -s $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > base.tmp
mv ./base.tmp ../../RESULTADOS/$test/256-nt_load.csv

make purge



#---------------------512
cd ../512
make

echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA vectorSum (normal)..."
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		./vectorSum -m WB -d NULL -o normal -s $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > base.tmp
mv ./base.tmp ../../RESULTADOS/$test/512-normal.csv


echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA vectorSum (vetorizado)..."
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		./vectorSum -m WB -d NULL -o vectorizing -s $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > base.tmp
mv ./base.tmp ../../RESULTADOS/$test/512-vectorizing.csv


echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA vectorSum (non-temporal load)..."
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		./vectorSum -m WB -d NULL -o nt_load -s $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > base.tmp
mv ./base.tmp ../../RESULTADOS/$test/512-nt_load.csv

make purge
#---------------------------------------------------------------------

cd ../../2-predication/

#------------------------------------------------------------------
test='TESTE2'
#------------------------------------------------------------------
#---------------------128
cd 128
make

echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA predication (normal)..."
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		./predication -o normal -l 1023 -v 128 -s $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > base.tmp
mv ./base.tmp ../../RESULTADOS/$test/128-normal.csv


echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA predication (predicado)..."
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		./predication -o predicated -l 1023 -v 128 -s $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > base.tmp
mv ./base.tmp ../../RESULTADOS/$test/128-predicated.csv

make purge



#---------------------256
cd ../256
make

echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA predication (normal)..."
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		./predication -o normal -l 1023 -v 128 -s $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > base.tmp
mv ./base.tmp ../../RESULTADOS/$test/256-normal.csv


echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA predication (predicado)..."
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		./predication -o predicated -l 1023 -v 128 -s $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > base.tmp
mv ./base.tmp ../../RESULTADOS/$test/256-predicated.csv

make purge



#---------------------512
cd ../512
make

echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA predication (normal)..."
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		./predication -o normal -l 1023 -v 128 -s $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > base.tmp
mv ./base.tmp ../../RESULTADOS/$test/512-normal.csv


echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA predication (predicado)..."
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		./predication -o predicated -l 1023 -v 128 -s $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > base.tmp
mv ./base.tmp ../../RESULTADOS/$test/512-predicated.csv

make purge






echo "TODOS OS TESTES FORAM CONCLUÍDOS COM SUCESSO!"
