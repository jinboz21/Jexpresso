# jExpresso
jExpresso

# Some notes on using jExpresso

To install and run the code assume Julia
version 1.7.2.

The [MPI.jl][0] package that is used assumes that you have a working MPI installation

## Setup with CPUs

```bash
julia --project=. -e "using Pkg; Pkg.instantiate(); Pkg.API.precompile()"
```
You can test that things were installed properly with
```bash
julia --project=. $JEXPRESSO_HOME/src/jexpresso.jl
```
where `$JEXPRESSO_HOME` is the path to the base jExpresso directory

## Problems building MPI.jl

If you are having problems building MPI.jl then most likely you need to set the
environment variable `JULIA_MPI_PATH`. Additionally, if your MPI is not
installed in a single place, e.g., MPI from macports in OSX, you may need to set
`JULIA_MPI_INCLUDE_PATH` and `JULIA_MPI_LIBRARY_PATH`; for macports installs of
MPI these would be subdirectories in `/opt/local/include` and `/opt/local/lib`.

## Setup with GPUs

```bash
julia --project=$JEXPRESSO_HOME/env/gpu -e "using Pkg; Pkg.instantiate(); Pkg.API.precompile()"
```
where `$JEXPRESSO_HOME` is the path to the base jExpresso directory

You can test that things were installed properly with
```bash
julia --project=$JEXPRESSO_HOME/env/gpu $JEXPRESSO_HOME/test/runtests.jl
```

[0]: https://github.com/JuliaParallel/MPI.jl
