#simple make for helloworld
HelloWorld: mod_mpi.o mpi_omp_helloworld.o mpi_START.o mpi_END.o cmd_parser.o
	mpif90 -fc=gfortran -fopenmp -o HelloWorld mod_mpi.o mpi_omp_helloworld.o mpi_START.o mpi_END.o cmd_parser.o

mod_mpi.o: mod_mpi.f90
	mpif90 -fc=gfortran -fopenmp -c -ffree-line-length-none mod_mpi.f90
mpi_omp_helloworld.o: mpi_omp_helloworld.f90
	mpif90 -fc=gfortran -fopenmp -c -ffree-line-length-none mpi_omp_helloworld.f90
mpi_START.o: mpi_START.f90
	mpif90 -fc=gfortran -fopenmp -c -ffree-line-length-none mpi_START.f90
mpi_END.o: mpi_END.f90
	mpif90 -fc=gfortran -fopenmp -c -ffree-line-length-none mpi_END.f90
mpi_END.o: mpi_END.f90
	mpif90 -fc=gfortran -fopenmp -c -ffree-line-length-none mpi_END.f90
cmd_parser.o: cmd_parser.f90
	mpif90 -fc=gfortran -fopenmp -c -ffree-line-length-none cmd_parser.f90

clean:
	rm -f *.o *.mod HelloWorld
#end of makefile
