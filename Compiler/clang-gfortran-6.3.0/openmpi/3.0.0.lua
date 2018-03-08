-- [[
-- This was built using:
-- $ ./configure --disable-wrapper-rpath --without-verbs CC=gcc CXX=g++ FC=gfortran --prefix=/Users/mathomp4/installed/Compiler/clang-gfortran-6.3.0/openmpi/3.0.0 | & tee configure.clang-gfortran-6.3.0.log
-- $ mv config.log config.clang-gfortran-6.3.0.log
-- $ make -j4 |& tee make.clang-gfortran-6.3.0.log
-- $ make install |& tee makeinstall.clang-gfortran-6.3.0.log
-- $ make check |& tee makecheck.clang-gfortran-6.3.0.log
--
-- ]]

family("MPI")
prereq("clang-gfortran/6.3.0")

local compilername = "clang-gfortran-6.3.0"

local version = "3.0.0"
local compiler = pathJoin("Compiler",compilername)
local homedir = os.getenv("HOME")
local installdir = pathJoin(homedir,"installed")
local pkgdir = pathJoin(installdir,compiler,"openmpi",version)

-- Setup Modulepath for packages built by this MPI stack
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir = pathJoin(mroot,"MPI/clang-gfortran-6.3.0",("openmpi-"..version))
prepend_path("MODULEPATH", mdir)

setenv("OPENMPI",pkgdir)
setenv("MPIHOME",pkgdir)
setenv("MPI_HOME",pkgdir)

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("INCLUDE",pathJoin(pkgdir,"include"))
prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))
