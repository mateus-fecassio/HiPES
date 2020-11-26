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
cd 512

make 2> makefile.txt

echo "REALIZANDO O TESTE DE MEDIÇÃO COM PERF PARA vectorSum (non-temporal load)... ---512"
for flag in ${flags[@]} ; 
	do
		sudo perf stat -e $flag nice -n $niceness taskset -c $task ./vectorSum -m WC -d $dev -o nt_load -s 100 -r $repetitions 2>> temporary.tmp
		mv ./temporary.tmp ../../RESULTADOS/$test/perf/512-nt_load_$flag.txt
	done

make purge
#---------------------------------------------------------------------
