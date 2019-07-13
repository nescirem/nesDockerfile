#!/bin/bash

green='\e[92m'
yellow='\e[93m'
none='\e[0m'

echo -e "$yellow Running fortran_mpi_omp test:$none"
eval mpiexec -n 4 ./HelloWorld -ts single
eval mpiexec -n 4 ./HelloWorld -ts funneled
eval mpiexec -n 4 ./HelloWorld -ts serialized
eval mpiexec -n 4 ./HelloWorld -ts multiple
echo -e "$green Complete!$none"
