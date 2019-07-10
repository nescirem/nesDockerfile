#!/bin/bash

green='\e[92m'
yellow='\e[93m'
none='\e[0m'

echo -e "$yellow Running fortran_mpi_omp test:$none"
eval ./HelloWorld
echo -e "$green Complete!$none"
