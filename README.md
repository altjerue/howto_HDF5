# howto_HDF5
This is a HOWTO for HDF5 presented at the IFM of the University of Michoacan (MEXICO) on July 12.

The official `HDF5` documentation can be found [here](https://portal.hdfgroup.org/display/HDF5/HDF5).

## Requirements

- `gcc` (with `gfortran`)
- `h5py`
- `matplotlib`
- `numpy`

## Installing `HDF5`

Download the latest version (or the version suitable for your system) of `HDF5` from [here](https://www.hdfgroup.org/downloads/hdf5/source-code/)

Go to the directory where the source code was uncompressed and compile the library

```
./configure --prefix=/path/to/lib/dir --enable-fortran --enable-cxx
make -j6
make install
```

The argument in the preffix flag is the full address of the directory where we want our library to be installed. This path must be in declared in the `PATH` variable. Usually, if you are admin rights, the recommended address is `/usr/local/bin`


## Installing `h5py`

```shell
$ pip install h5py
```

## How to work with this totorial

Clone this repository

```shell
git clone https://github.com/altjerue/howto_HDF5.git
```

Go to `howto_HDF5` directory and you will have access to the example files in this repository.

## Working with `HDF5` files in `python`
```python
import h5py
```
