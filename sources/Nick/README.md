### dependencies
- cmake 
- verilator
- SDL2

### quickstart
```shell
# create build directory
mkdir build && cd build
# configure cmake project
cmake ..
# link resource files
ln -sr ../../../artwork/*.mem .
# build
make -j
# run integration test
./Vintegration
```
