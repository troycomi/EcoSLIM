cmake_minimum_required(VERSION 3.13)
project(EcoSLIM LANGUAGES Fortran CUDA)

include(cmake/utils/setFlags.cmake)

# sets path for executables
set(EXECUTABLE_OUTPUT_PATH ${CMAKE_CURRENT_BINARY_DIR}/bin)
find_package(MPI REQUIRED COMPONENTS Fortran)
set(CMAKE_Fortran_COMPILER ${MPI_Fortran_COMPILER})

# adds custom cmake functions
include(cmake/utils/fortranFunctions.cmake)

add_subdirectory(src)
