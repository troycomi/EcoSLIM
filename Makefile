 EcoSLIM.exe : src/EcoSLIM_CUDA_MPI.cuf
	mpif90 -o EcoSLIM.exe src/ecoslim_*.cuf src/*.f90 src/EcoSLIM_CUDA_MPI.cuf

 clean :
	rm -f *.o *.mod EcoSLIM.exe
