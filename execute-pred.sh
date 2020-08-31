#!/bin/bash


#número de repetições
repetitions="10"

#início
INIT=1

#fim
END=100

flags='cache-misses,cpu-cycles:u,cpu-cycles:k,L1-dcache-loads,L1-dcache-load-misses,L1-dcache-stores,L1-icache-load-misses,LLC-loads,LLC-load-misses,LLC-stores,LLC-store-misses,mem_load_retired.l1_hit,mem_load_retired.l1_miss,mem_load_retired.l2_hit,mem_load_retired.l2_miss,mem_load_retired.l3_hit,mem_load_retired.l3_miss'

leng=1023

value=128

mode='WB'

dev='/home/mfcf17/uncached-ram-wc/dev'

operation='predicated'


cd 2-predication
#------------------------------------------------------------------
test='TESTE8'
#------------------------------------------------------------------
#---------------------128
cd 128
make 2> makefile.txt


echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA predication (predicado)... ---128"
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		./predication -m $mode -d $dev -o $operation -l $leng -v $value -s $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > base.tmp
mv ./base.tmp ../../RESULTADOS/$test/128-predicated.csv

echo "REALIZANDO O TESTE DE MEDIÇÃO COM PERF PARA predication (predicado)... ---128"
for ((size=INIT; size<=END; size++)) ; 
	do
		perf stat -e $flags ./predication -m $mode -d $dev -o $operation -l $leng -v $value -s $size -r $repetitions 2>> temporary.tmp
		mv ./temporary.tmp ../../RESULTADOS/$test/perf/128-predicated_$size.txt
	done

make purge



#---------------------256
cd ../256
make 2> makefile.txt

echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA predication (normal)..."
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
        ./predication -m $mode -d $dev -o normal -l $leng -v $value -s $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > base.tmp
mv ./base.tmp ../../RESULTADOS/$test/normal.csv

echo "REALIZANDO O TESTE DE MEDIÇÃO COM PERF PARA predication (normal)..."
for ((size=INIT; size<=END; size++)) ; 
	do
		perf stat -e $flags ./predication -m $mode -d $dev -o normal -l $leng -v $value -s $size -r $repetitions 2>> temporary.tmp
		mv ./temporary.tmp ../../RESULTADOS/$test/perf/normal_$size.txt
	done


echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA predication (predicado)... ---256"
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		./predication -m $mode -d $dev -o $operation -l $leng -v $value -s $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > base.tmp
mv ./base.tmp ../../RESULTADOS/$test/256-predicated.csv

echo "REALIZANDO O TESTE DE MEDIÇÃO COM PERF PARA predication (predicado)... ---256"
for ((size=INIT; size<=END; size++)) ; 
	do
		perf stat -e $flags ./predication -m $mode -d $dev -o $operation -l $leng -v $value -s $size -r $repetitions 2>> temporary.tmp
		mv ./temporary.tmp ../../RESULTADOS/$test/perf/256-predicated_$size.txt
	done
	
make purge



#---------------------512
cd ../512
make 2> makefile.txt


echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA predication (predicado)... ---512"
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		./predication -m $mode -d $dev -o $operation -l $leng -v $value -s $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > base.tmp
mv ./base.tmp ../../RESULTADOS/$test/512-predicated.csv

echo "REALIZANDO O TESTE DE MEDIÇÃO COM PERF PARA predication (predicado)... ---512"
for ((size=INIT; size<=END; size++)) ; 
	do
		perf stat -e $flags ./predication -m $mode -d $dev -o $operation -l $leng -v $value -s $size -r $repetitions 2>> temporary.tmp
		mv ./temporary.tmp ../../RESULTADOS/$test/perf/512-predicated_$size.txt
	done

make purge



echo "TODOS OS TESTES FORAM CONCLUÍDOS COM SUCESSO!"