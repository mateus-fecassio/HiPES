#!/bin/bash

teste='TESTE1'

size=100
repetitions=10
flags='L1-dcache-loads,L1-dcache-load-misses,L1-dcache-stores,L1-icache-load-misses,LLC-loads,LLC-load-misses,LLC-stores,LLC-store-misses'


#------------------------------------------------------------------128
cd 128
cd vectorSum1
make

echo "REALIZANDO O TESTE DE MEDIÇÃO COM PERF PARA vectorSum1 (base)..."
perf stat -e $flags ./vectorSum -d $size -r $repetitions 2>> temp.tmp
mv ./temp.tmp ../../RESULTADOS/$test/perf/128-base.tmp
make purge


cd ..
cd vectorSum2
make

echo "REALIZANDO O TESTE DE MEDIÇÃO COM PERF PARA vectorSum2 (vetorizado)..."
perf stat -e $flags ./vectorSum -d $size -r $repetitions 2>> temp.tmp
mv ./temp.tmp ../../RESULTADOS/$test/perf/128-vetorizado.tmp
make purge


cd ..
cd vectorSum3
make

echo "REALIZANDO O TESTE DE MEDIÇÃO COM PERF PARA vectorSum3 (vetorizado e nt load)..."
perf stat -e $flags ./vectorSum -d $size -r $repetitions 2>> temp.tmp
mv ./temp.tmp ../../RESULTADOS/$test/perf/128-vetorizado_nt_load.tmp
make purge
#---------------------------------------------------------------------


#------------------------------------------------------------------256
cd ../..
cd 256
cd vectorSum1
make

echo "REALIZANDO O TESTE DE MEDIÇÃO COM PERF PARA vectorSum1 (base)..."
perf stat -e $flags ./vectorSum -d $size -r $repetitions 2>> temp.tmp
mv ./temp.tmp ../../RESULTADOS/$test/perf/256-base.tmp
make purge


cd ..
cd vectorSum2
make

echo "REALIZANDO O TESTE DE MEDIÇÃO COM PERF PARA vectorSum2 (vetorizado)..."
perf stat -e $flags ./vectorSum -d $size -r $repetitions 2>> temp.tmp
mv ./temp.tmp ../../RESULTADOS/$test/perf/256-vetorizado.tmp
make purge


cd ..
cd vectorSum3
make

echo "REALIZANDO O TESTE DE MEDIÇÃO COM PERF PARA vectorSum3 (vetorizado e nt load)..."
perf stat -e $flags ./vectorSum -d $size -r $repetitions 2>> temp.tmp
mv ./temp.tmp ../../RESULTADOS/$test/perf/256-vetorizado_nt_load.tmp
make purge
#---------------------------------------------------------------------


#------------------------------------------------------------------512
cd ../..
cd 512
cd vectorSum1
make

echo "REALIZANDO O TESTE DE MEDIÇÃO COM PERF PARA vectorSum1 (base)..."
perf stat -e $flags ./vectorSum -d $size -r $repetitions 2>> temp.tmp
mv ./temp.tmp ../../RESULTADOS/$test/perf/512-base.tmp
make purge


cd ..
cd vectorSum2
make

echo "REALIZANDO O TESTE DE MEDIÇÃO COM PERF PARA vectorSum2 (vetorizado)..."
perf stat -e $flags ./vectorSum -d $size -r $repetitions 2>> temp.tmp
mv ./temp.tmp ../../RESULTADOS/$test/perf/512-vetorizado.tmp
make purge


cd ..
cd vectorSum3
make

echo "REALIZANDO O TESTE DE MEDIÇÃO COM PERF PARA vectorSum3 (vetorizado e nt load)..."
perf stat -e $flags ./vectorSum -d $size -r $repetitions 2>> temp.tmp
mv ./temp.tmp ../../RESULTADOS/$test/perf/512-vetorizado_nt_load.tmp
make purge
#---------------------------------------------------------------------

echo "TODOS OS TESTES FORAM CONCLUÍDOS COM SUCESSO!"
