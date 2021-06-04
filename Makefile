 EcoSLIM.exe : EcoSLIM_CUDA_MPI.cuf
	mpif90 -o EcoSLIM.exe ecoslim_*.cuf *.f90 EcoSLIM_CUDA_MPI.cuf

 clean :
	rm -f *.o *.mod EcoSLIM.exe
