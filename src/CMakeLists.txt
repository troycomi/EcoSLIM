# this determines the executable name
add_executable(EcoSLIM
    EcoSLIM_CUDA_MPI.cuf
    pfb_read.f90
    pfb_write.f90
    vtk_write.f90
    vtk_write_points.f90
    )
set_source_files_properties(EcoSLIM_CUDA_MPI.cuf PROPERTIES LANGUAGE Fortran)

# this adds dependencies by name
target_link_libraries(EcoSLIM
    PRIVATE create_subgrid
    PRIVATE ran_mod
    PRIVATE mpiDeviceUtil
    PRIVATE particles_loop
    )
# need to tell compiler this is using cuda code
target_link_options(EcoSLIM
    PRIVATE -Mcuda)

# this specifies a library
add_fortran_library(create_subgrid ecoslim_create_subgrid.f90)
add_fortran_library(ran_mod ran1.mod.f90)

# for .cuf files, need to set the language as well
add_fortran_library(mpiDeviceUtil ecoslim_device_utility.cuf)
set_source_files_properties(ecoslim_device_utility.cuf PROPERTIES LANGUAGE Fortran)
add_fortran_library(particles_loop ecoslim_particles_loop.cuf)
set_source_files_properties(ecoslim_particles_loop.cuf PROPERTIES LANGUAGE Fortran)
