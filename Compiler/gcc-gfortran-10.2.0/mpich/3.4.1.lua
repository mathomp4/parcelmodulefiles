-- [[
--
-- This was built using:
-- unset F90
-- $ ./configure CC=gcc CXX=g++ FC=gfortran FFLAGS=-fallow-argument-mismatch CXXFLAGS=-Wno-deprecated CFLAGS="-fgnu89-inline -Wno-deprecated" --prefix=$HOME/installed/Compiler/gcc-gfortran-10.2.0/mpich/3.4.1 --with-device=ch3 |& tee configure.gcc-gfortran-10.2.0.log 
--
-- The FLAGS are from Brew: https://github.com/Homebrew/homebrew-core/blob/HEAD/Formula/mpich.rb
-- The device=ch3 is from: https://github.com/pmodels/mpich/issues/5041
-- 
-- $ mv config.log config.gcc-gfortran-10.2.0.log
-- $ make -j4 |& tee make.gcc-gfortran-10.2.0.log
-- $ make install |& tee makeinstall.gcc-gfortran-10.2.0.log
-- $ make check |& tee makecheck.gcc-gfortran-10.2.0.log
--
-- ]]

family("MPI")
prereq("gcc-gfortran/10.2.0")

local compilername = "gcc-gfortran-10.2.0"

local version = "3.4.1"
local compiler = pathJoin("Compiler",compilername)
local homedir = os.getenv("HOME")
local installdir = pathJoin(homedir,"installed")
local pkgdir = pathJoin(installdir,compiler,"mpich",version)

-- Setup Modulepath for packages built by this MPI stack
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir = pathJoin(mroot,"MPI/gcc-gfortran-10.2.0",("mpich-"..version))
prepend_path("MODULEPATH", mdir)

setenv("MPICH",pkgdir)
setenv("MPIHOME",pkgdir)
setenv("MPI_HOME",pkgdir)

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("DYLD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("INCLUDE",pathJoin(pkgdir,"include"))
prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))
