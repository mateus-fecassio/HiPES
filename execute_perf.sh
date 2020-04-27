#!/bin/bash

cd vectorSum1
make

echo "REALIZANDO O TESTE DE MEDIÇÃO COM PERF PARA vectorSum1 (base)..."
perf stat -e L1-dcache-loads,L1-dcache-load-misses,L1-dcache-stores,L1-icache-load-misses,LLC-loads,LLC-load-misses,LLC-stores,LLC-store-misses ./vectorSum -d 128 -r 10 >> temp.tmp
mv ./temp.tmp ../perf_base.tmp
make purge




cd ..
cd vectorSum2
make

echo "REALIZANDO O TESTE DE MEDIÇÃO COM PERF PARA vectorSum2 (vetorizado)..."
perf stat -e L1-dcache-loads,L1-dcache-load-misses,L1-dcache-stores,L1-icache-load-misses,LLC-loads,LLC-load-misses,LLC-stores,LLC-store-misses ./vectorSum -d 128 -r 10 >> temp.tmp
mv ./temp.tmp ../perf_vetorizado.tmp
make purge




cd ..
cd vectorSum3
make

echo "REALIZANDO O TESTE DE MEDIÇÃO COM PERF PARA vectorSum3 (vetorizado e nt load)..."
perf stat -e L1-dcache-loads,L1-dcache-load-misses,L1-dcache-stores,L1-icache-load-misses,LLC-loads,LLC-load-misses,LLC-stores,LLC-store-misses ./vectorSum -d 128 -r 10 >> temp.tmp
mv ./temp.tmp ../perf_vetorizado_nt_load.tmp
make purge