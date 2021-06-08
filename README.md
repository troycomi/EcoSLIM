# EcoSLIM
EcoSLIM

To build with cmake
```
# in the ecoslim base directory

# will produce configuration
cmake -S . -B build cmake

# will build the project
cmake --build build
```
The executable will be generated in `build/bin/EcoSLIM`

Environments for reference
1. workstation
pgi/19.10
cuda/10.2
NVIDIA Geforce GTX 1080Ti

2. Casper
nvhpc/20.11
cuda/11.0.3
openmpi/4.0.5
NVIDIA Tesla V100
