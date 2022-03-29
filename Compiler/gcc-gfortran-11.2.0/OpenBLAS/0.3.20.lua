-- [[
--
-- Modulefile for OpenBLAS 0.3.20
--
-- This was built using:
-- $ mkdir build-gcc-gfortran-11.2.0
-- $ cd build-gcc-gfortran-11.2.0
-- $ cmake .. -DCMAKE_INSTALL_PREFIX=$HOME/installed/Compiler/gcc-gfortran-11.2.0/OpenBLAS/0.3.20 |& tee cmake.gcc-gfortran-11.2.0.log
-- $ make -j4 install |& tee makeinstall.gcc-gfortran-11.2.0.log
-- $ make check |& tee makecheck.gcc-gfortran-11.2.0.log
--
-- ]]

prereq("gcc-gfortran/11.2.0")

local compilername = "gcc-gfortran-11.2.0"

local version = "0.3.20"
local compiler = pathJoin("Compiler",compilername)
local homedir = os.getenv("HOME")
local installdir = pathJoin(homedir,"installed")
local pkgdir = pathJoin(installdir,compiler,"OpenBLAS",version)

-- -- Setup Modulepath for packages built by this MPI stack
-- local mroot = os.getenv("MODULEPATH_ROOT")
-- local mdir = pathJoin(mroot,"MPI/gcc-gfortran-11.2.0",("OpenBLAS-"..version))
-- prepend_path("MODULEPATH", mdir)

setenv("OPENBLAS",pkgdir)
setenv("BLAS_ROOT",pkgdir)
setenv("LAPACK_ROOT",pkgdir)

-- prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("DYLD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("INCLUDE",pathJoin(pkgdir,"include"))
prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))
