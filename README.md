# EcoSLIM
*EcoSLIM* is a Lagrangian, particle-tracking code that simulates advective and
diffusive movement of water parcels.  This code can be used to simulate age,
diagnose travel times, source water composition and flowpaths.  It integrates
seamlessly with *ParFlow-CLM*.

## Building and Running
To build with cmake
```
# in the ecoslim base directory

# will produce configuration
cmake -S . -B build cmake

# will build the project
cmake --build build
```
The executable will be generated in `build/bin/EcoSLIM`

## Multi-GPU
For more details on the implementation and if you use multi-GPU EcoSLIM in
published work please cite the following reference:  
   *Yang, Chen, You-Kuan Zhang, Xiuyu Liang, Catherine Olschanowsky, Xiaofan
   Yang, and Reed Maxwell. "Accelerating the Lagrangian particle tracking of
   residence time distributions and source water mixing towards large scales."
   Computers & Geosciences 151 (2021): 104760.
   [https://doi.org/10.1016/j.cageo.2021.104760](https://doi.org/10.1016/j.cageo.2021.104760)*


Environments for reference
1. workstation
```
pgi/19.10
cuda/10.2
```
NVIDIA Geforce GTX 1080Ti

2. Casper
```
nvhpc/20.11
cuda/11.0.3
openmpi/4.0.5
```
NVIDIA Tesla V100

3. Della GPU
```
cudatoolkit/11.1
nvhpc/21.5
openmpi/nvhpc-21.5/4.1.1
```
NVIDIA Tesla A100
