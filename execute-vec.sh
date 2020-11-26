#!/bin/bash


#número de repetições
repetitions="100"

#início
INIT=1

#fim
END=100

#niceness (-20 (most favorable scheduling) to 19 (least favorable))
niceness='-10'

#taskset
task='0'

flags=(instructions cpu-cycles:u cpu-cycles:k L1-dcache-loads L1-dcache-load-misses L1-dcache-stores LLC-loads LLC-load-misses LLC-stores LLC-store-misses mem_load_retired.l1_hit mem_load_retired.l1_miss mem_load_retired.l2_hit mem_load_retired.l2_miss mem_load_retired.l3_hit mem_load_retired.l3_miss)

dev='/home/mfcf17/uncached-ram-wc/dev'

date >> time.txt


#------------------------------------------------------------------
test='TESTE9'
#------------------------------------------------------------------
#---------------------128
cd 1-vectorSum
cd 128
make 2> makefile.txt


echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA vectorSum (vetorizado)... ---128"
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		sudo nice -n $niceness taskset -c $task ./vectorSum -m WB -d NULL -o vectorizing -s $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > base.tmp
mv ./base.tmp ../../RESULTADOS/$test/128-vectorizing.csv

echo "REALIZANDO O TESTE DE MEDIÇÃO COM PERF PARA vectorSum (vetorizado)... ---128"
for flag in ${flags[@]} ; 
	do
		sudo perf stat -e $flag nice -n $niceness taskset -c $task ./vectorSum -m WB -d NULL -o vectorizing -s 100 -r $repetitions 2>> temporary.tmp
		mv ./temporary.tmp ../../RESULTADOS/$test/perf/128-vectorizing_$flag.txt
	done


echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA vectorSum (non-temporal load)... ---128"
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		sudo nice -n $niceness taskset -c $task ./vectorSum -m WC -d $dev -o nt_load -s $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > base.tmp
mv ./base.tmp ../../RESULTADOS/$test/128-nt_load.csv

echo "REALIZANDO O TESTE DE MEDIÇÃO COM PERF PARA vectorSum (non-temporal load)... ---128"
for flag in ${flags[@]} ; 
	do
		sudo perf stat -e $flag nice -n $niceness taskset -c $task ./vectorSum -m WC -d $dev -o nt_load -s 100 -r $repetitions 2>> temporary.tmp
		mv ./temporary.tmp ../../RESULTADOS/$test/perf/128-nt_load_$flag.txt
	done

make purge



#---------------------256
cd ../256
make 2> makefile.txt

echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA vectorSum (normal)..."
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		sudo nice -n $niceness taskset -c $task ./vectorSum -m WB -d NULL -o normal -s $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > base.tmp
mv ./base.tmp ../../RESULTADOS/$test/normal.csv

echo "REALIZANDO O TESTE DE MEDIÇÃO COM PERF PARA vectorSum (normal)..."
for flag in ${flags[@]} ; 
	do
		sudo perf stat -e $flag nice -n $niceness taskset -c $task ./vectorSum -m WB -d NULL -o normal -s 100 -r $repetitions 2>> temporary.tmp
		mv ./temporary.tmp ../../RESULTADOS/$test/perf/normal_$flag.txt
	done


echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA vectorSum (vetorizado)... ---256"
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		sudo nice -n $niceness taskset -c $task ./vectorSum -m WB -d NULL -o vectorizing -s $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > base.tmp
mv ./base.tmp ../../RESULTADOS/$test/256-vectorizing.csv

echo "REALIZANDO O TESTE DE MEDIÇÃO COM PERF PARA vectorSum (vetorizado)... ---256"
for flag in ${flags[@]} ; 
	do
		sudo perf stat -e $flag nice -n $niceness taskset -c $task ./vectorSum -m WB -d NULL -o vectorizing -s 100 -r $repetitions 2>> temporary.tmp
		mv ./temporary.tmp ../../RESULTADOS/$test/perf/256-vectorizing_$flag.txt
	done


echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA vectorSum (non-temporal load)... ---256"
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		sudo nice -n $niceness taskset -c $task ./vectorSum -m WC -d $dev -o nt_load -s $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > base.tmp
mv ./base.tmp ../../RESULTADOS/$test/256-nt_load.csv

echo "REALIZANDO O TESTE DE MEDIÇÃO COM PERF PARA vectorSum (non-temporal load)... ---256"
for flag in ${flags[@]} ; 
	do
		sudo perf stat -e $flag nice -n $niceness taskset -c $task ./vectorSum -m WC -d $dev -o nt_load -s 100 -r $repetitions 2>> temporary.tmp
		mv ./temporary.tmp ../../RESULTADOS/$test/perf/256-nt_load_$flag.txt
	done

make purge



#---------------------512
cd ../512
make 2> makefile.txt

echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA vectorSum (vetorizado)... ---512"
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		sudo nice -n $niceness taskset -c $task ./vectorSum -m WB -d NULL -o vectorizing -s $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > base.tmp
mv ./base.tmp ../../RESULTADOS/$test/512-vectorizing.csv

echo "REALIZANDO O TESTE DE MEDIÇÃO COM PERF PARA vectorSum (vetorizado)... ---512"
for flag in ${flags[@]} ; 
	do
		sudo perf stat -e $flag nice -n $niceness taskset -c $task ./vectorSum -m WB -d NULL -o vectorizing -s 100 -r $repetitions 2>> temporary.tmp
		mv ./temporary.tmp ../../RESULTADOS/$test/perf/512-vectorizing_$flag.txt
	done


echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA vectorSum (non-temporal load)... ---512"
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		sudo nice -n $niceness taskset -c $task ./vectorSum -m WC -d $dev -o nt_load -s $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > base.tmp
mv ./base.tmp ../../RESULTADOS/$test/512-nt_load.csv

echo "REALIZANDO O TESTE DE MEDIÇÃO COM PERF PARA vectorSum (non-temporal load)... ---512"
for flag in ${flags[@]} ; 
	do
		sudo perf stat -e $flag nice -n $niceness taskset -c $task ./vectorSum -m WC -d $dev -o nt_load -s 100 -r $repetitions 2>> temporary.tmp
		mv ./temporary.tmp ../../RESULTADOS/$test/perf/512-nt_load_$flag.txt
	done

make purge
#---------------------------------------------------------------------

cd ../../
date >> time.txt

echo "TODOS OS TESTES FORAM CONCLUÍDOS COM SUCESSO!"
