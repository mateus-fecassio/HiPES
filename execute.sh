#!/bin/bash


#número de repetições
repetitions="10"

#início
INIT=1

#fim
END=2

flags='L1-dcache-loads,L1-dcache-load-misses,L1-dcache-stores,L1-icache-load-misses,LLC-loads,LLC-load-misses,LLC-stores,LLC-store-misses'

leng=1023

value=128


#------------------------------------------------------------------
test='TESTE1'
#------------------------------------------------------------------
#---------------------128
cd 1-vectorSum
cd 128
make

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
		perf stat -e $flags ./vectorSum -m WB -d NULL -o normal -s $size -r $repetitions 2>> temp.tmp
		mv ./temp.tmp ../../RESULTADOS/$test/perf/128-normal_$size.txt
	done


echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA vectorSum (vetorizado)... ---128"
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		./vectorSum -m WB -d NULL -o vectorizing -s $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > base.tmp
mv ./base.tmp ../../RESULTADOS/$test/128-vectorizing.csv

echo "REALIZANDO O TESTE DE MEDIÇÃO COM PERF PARA vectorSum (vetorizado)... ---128"
for ((size=INIT; size<=END; size++)) ; 
	do
		perf stat -e $flags ./vectorSum -m WB -d NULL -o vectorizing -s $size -r $repetitions 2>> temp.tmp
		mv ./temp.tmp ../../RESULTADOS/$test/perf/128-vectorizing_$size.txt
	done


echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA vectorSum (non-temporal load)... ---128"
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		./vectorSum -m WB -d NULL -o nt_load -s $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > base.tmp
mv ./base.tmp ../../RESULTADOS/$test/128-nt_load.csv

echo "REALIZANDO O TESTE DE MEDIÇÃO COM PERF PARA vectorSum (non-temporal load)... ---128"
for ((size=INIT; size<=END; size++)) ; 
	do
		perf stat -e $flags ./vectorSum -m WB -d NULL -o nt_load -s $size -r $repetitions 2>> temp.tmp
		mv ./temp.tmp ../../RESULTADOS/$test/perf/128-nt_load_$size.txt
	done

make purge



#---------------------256
cd ../256
make

echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA vectorSum (normal)... ---256"
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		./vectorSum -m WB -d NULL -o normal -s $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > base.tmp
mv ./base.tmp ../../RESULTADOS/$test/256-normal.csv

echo "REALIZANDO O TESTE DE MEDIÇÃO COM PERF PARA vectorSum (normal)... ---256"
for ((size=INIT; size<=END; size++)) ; 
	do
		perf stat -e $flags ./vectorSum -m WB -d NULL -o normal -s $size -r $repetitions 2>> temp.tmp
		mv ./temp.tmp ../../RESULTADOS/$test/perf/256-normal_$size.txt
	done


echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA vectorSum (vetorizado)... ---256"
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		./vectorSum -m WB -d NULL -o vectorizing -s $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > base.tmp
mv ./base.tmp ../../RESULTADOS/$test/256-vectorizing.csv

echo "REALIZANDO O TESTE DE MEDIÇÃO COM PERF PARA vectorSum (vetorizado)... ---256"
for ((size=INIT; size<=END; size++)) ; 
	do
		perf stat -e $flags ./vectorSum -m WB -d NULL -o vectorizing -s $size -r $repetitions 2>> temp.tmp
		mv ./temp.tmp ../../RESULTADOS/$test/perf/256-vectorizing_$size.txt
	done


echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA vectorSum (non-temporal load)... ---256"
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		./vectorSum -m WB -d NULL -o nt_load -s $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > base.tmp
mv ./base.tmp ../../RESULTADOS/$test/256-nt_load.csv

echo "REALIZANDO O TESTE DE MEDIÇÃO COM PERF PARA vectorSum (non-temporal load)... ---256"
for ((size=INIT; size<=END; size++)) ; 
	do
		perf stat -e $flags ./vectorSum -m WB -d NULL -o nt_load -s $size -r $repetitions 2>> temp.tmp
		mv ./temp.tmp ../../RESULTADOS/$test/perf/256-nt_load_$size.txt
	done

make purge



#---------------------512
cd ../512
make

echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA vectorSum (normal)... ---512"
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		./vectorSum -m WB -d NULL -o normal -s $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > base.tmp
mv ./base.tmp ../../RESULTADOS/$test/512-normal.csv

echo "REALIZANDO O TESTE DE MEDIÇÃO COM PERF PARA vectorSum (normal)... ---512"
for ((size=INIT; size<=END; size++)) ; 
	do
		perf stat -e $flags ./vectorSum -m WB -d NULL -o normal -s $size -r $repetitions 2>> temp.tmp
		mv ./temp.tmp ../../RESULTADOS/$test/perf/512-normal_$size.txt
	done


echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA vectorSum (vetorizado)... ---512"
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		./vectorSum -m WB -d NULL -o vectorizing -s $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > base.tmp
mv ./base.tmp ../../RESULTADOS/$test/512-vectorizing.csv

echo "REALIZANDO O TESTE DE MEDIÇÃO COM PERF PARA vectorSum (vetorizado)... ---512"
for ((size=INIT; size<=END; size++)) ; 
	do
		perf stat -e $flags ./vectorSum -m WB -d NULL -o vectorizing -s $size -r $repetitions 2>> temp.tmp
		mv ./temp.tmp ../../RESULTADOS/$test/perf/256-vectorizing_$size.txt
	done


echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA vectorSum (non-temporal load)... ---512"
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		./vectorSum -m WB -d NULL -o nt_load -s $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > base.tmp
mv ./base.tmp ../../RESULTADOS/$test/512-nt_load.csv

echo "REALIZANDO O TESTE DE MEDIÇÃO COM PERF PARA vectorSum (non-temporal load)... ---256"
for ((size=INIT; size<=END; size++)) ; 
	do
		perf stat -e $flags ./vectorSum -m WB -d NULL -o nt_load -s $size -r $repetitions 2>> temp.tmp
		mv ./temp.tmp ../../RESULTADOS/$test/perf/256-nt_load_$size.txt
	done

make purge
#---------------------------------------------------------------------

cd ../../2-predication/

#------------------------------------------------------------------
test='TESTE2'
#------------------------------------------------------------------
#---------------------128
cd 128
make

echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA predication (normal)... ---128"
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		./predication -o normal -l $leng -v $value -s $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > base.tmp
mv ./base.tmp ../../RESULTADOS/$test/128-normal.csv

echo "REALIZANDO O TESTE DE MEDIÇÃO COM PERF PARA predication (normal)... ---128"
for ((size=INIT; size<=END; size++)) ; 
	do
		perf stat -e $flags ./predication -o normal -l $leng -v $value -s $size -r $repetitions 2>> temp.tmp
		mv ./temp.tmp ../../RESULTADOS/$test/perf/128-normal_$size.txt
	done


echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA predication (predicado)... ---128"
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		./predication -o predicated -l $leng -v $value -s $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > base.tmp
mv ./base.tmp ../../RESULTADOS/$test/128-predicated.csv

echo "REALIZANDO O TESTE DE MEDIÇÃO COM PERF PARA predication (predicado)... ---128"
for ((size=INIT; size<=END; size++)) ; 
	do
		perf stat -e $flags ./predication -o predicated -l $leng -v $value -s $size -r $repetitions 2>> temp.tmp
		mv ./temp.tmp ../../RESULTADOS/$test/perf/128-predicated_$size.txt
	done

make purge



#---------------------256
cd ../256
make

echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA predication (normal)... ---256"
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		./predication -o normal -l $leng -v $value -s $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > base.tmp
mv ./base.tmp ../../RESULTADOS/$test/256-normal.csv

echo "REALIZANDO O TESTE DE MEDIÇÃO COM PERF PARA predication (normal)... ---256"
for ((size=INIT; size<=END; size++)) ; 
	do
		perf stat -e $flags ./predication -o normal -l $leng -v $value -s $size -r $repetitions 2>> temp.tmp
		mv ./temp.tmp ../../RESULTADOS/$test/perf/256-normal_$size.txt
	done


echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA predication (predicado)... ---256"
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		./predication -o predicated -l $leng -v $value -s $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > base.tmp
mv ./base.tmp ../../RESULTADOS/$test/256-predicated.csv

echo "REALIZANDO O TESTE DE MEDIÇÃO COM PERF PARA predication (predicado)... ---256"
for ((size=INIT; size<=END; size++)) ; 
	do
		perf stat -e $flags ./predication -o predicated -l $leng -v $value -s $size -r $repetitions 2>> temp.tmp
		mv ./temp.tmp ../../RESULTADOS/$test/perf/256-predicated_$size.txt
	done
	
make purge



#---------------------512
cd ../512
make

echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA predication (normal)... ---512"
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		./predication -o normal -l $leng -v $value -s $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > base.tmp
mv ./base.tmp ../../RESULTADOS/$test/512-normal.csv

echo "REALIZANDO O TESTE DE MEDIÇÃO COM PERF PARA predication (normal)... ---512"
for ((size=INIT; size<=END; size++)) ; 
	do
		perf stat -e $flags ./predication -o normal -l $leng -v $value -s $size -r $repetitions 2>> temp.tmp
		mv ./temp.tmp ../../RESULTADOS/$test/perf/512-normal_$size.txt
	done


echo "REALIZANDO O TESTE DE MEDIÇÃO DE TEMPO PARA predication (predicado)... ---512"
for ((size=INIT; size<=END; size++)) ; 
	do
		#echo "$size (MBytes) done"
		./predication -o predicated -l $leng -v $value -s $size -r $repetitions > temp.tmp
		printf "$((size)) "
		printf "$(grep '.' temp.tmp  | tr '.' ',')\n"
	done > base.tmp
mv ./base.tmp ../../RESULTADOS/$test/512-predicated.csv

echo "REALIZANDO O TESTE DE MEDIÇÃO COM PERF PARA predication (predicado)... ---512"
for ((size=INIT; size<=END; size++)) ; 
	do
		perf stat -e $flags ./predication -o predicated -l $leng -v $value -s $size -r $repetitions 2>> temp.tmp
		mv ./temp.tmp ../../RESULTADOS/$test/perf/512-predicated_$size.txt
	done

make purge






echo "TODOS OS TESTES FORAM CONCLUÍDOS COM SUCESSO!"
