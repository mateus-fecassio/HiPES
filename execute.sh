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

leng=1023

value=128

test='TESTE10'

cd 2-predication
cd 256
make 2> makefile.txt

echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA predication (normal)..."
for ((size=INIT; size<=40; size++)) ; 
	do
		#echo "$size (MBytes) done"
        sudo nice -n $niceness taskset -c $task ./predication -m WB -d NULL -o normal -l $leng -v $value -s $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > base.tmp
mv ./base.tmp ../../RESULTADOS/$test/novo_normal.csv