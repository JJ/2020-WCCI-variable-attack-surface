#!/bin/sh

# Shell script to run n times the genetic algorithm
# Enter as first parameter the number of executions
# example: ./run.sh 30 16 for 30 executions and a population of 16 individuals

export INDIVIDUALS=$2

for i in `seq $1` ; do
    echo "Running $i execution..."
    docker-compose exec -T www.exampletfm.com python3 genetic.py --individuals  ${INDIVIDUALS} > results/secdef/secdef_${INDIVIDUALS}_$i.txt

done
echo "Finished!"
