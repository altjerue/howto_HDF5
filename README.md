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
$ ./configure --prefix=/path/to/lib/dir --enable-fortran --enable-cxx
$ make -j6
$ make install
```

The argument in the preffix flag is the full address of the directory where we want our library to be installed. This path must be in declared in the environment variable `PATH` in your init file (e.g., `.bashrc`, `.profile`, `.zbashrc`, `.zprofile`, etc.). If you are admin or have root permission, the recommended address is `/usr/local/bin`


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

## Saving data in `FORTRAN`

In the file `firsth5.F90` I have placed a simple code in which I show how to save scalars, vectors and matrices in a `HDF5` formatted file.

For the case of 2D matrices I have written two blocks saving two different matrices and with different data set label: `y(t = 1)` and `y(t = 2)`. This to exemplify how a N-dimensional array can be saved for, e.g., different times.

## Working with `HDF5` files in `python`

To manipulate `HDF5` files in `python` in has to import the module

```python
import h5py
```

In the file `ploth5.py` I show a simple script of how to extract data from an `HDF5` file and plot it. Tu run this script one simply enters to the `python` interpreter. I recomend installing `IPython`. So we go to the terminal and type

```shell
ipython
```

Once inside the interpreter we just type:

```python
In [1]: run ploth5.py
```

The above instruction is the same as writing the content (line by line) of `ploth5.py` in the interpreter.
