#simple make for helloworld
HelloWorld: read_cgns.o write_cgns.o test_cgns.o
	mpif90 -fc=gfortran -cpp -I/usr/local/include  -o HelloWorld read_cgns.o write_cgns.o test_cgns.o -lcgns
read_cgns.o: read_cgns.f90
	mpif90 -fc=gfortran -fopenmp -cpp -I/usr/local/include -ffree-line-length-none -c read_cgns.f90 
write_cgns.o: write_cgns.f90
	mpif90 -fc=gfortran -fopenmp -cpp -I/usr/local/include -ffree-line-length-none -c write_cgns.f90
test_cgns.o: test_cgns.f90
	mpif90 -fc=gfortran -fopenmp -cpp -ffree-line-length-none -c test_cgns.f90
clean:
	rm -f *.o HelloWorld *.cgns
#end of makefile
