-- [[
-- This was built using:
-- $ ./configure --disable-wrapper-rpath CC=gcc CXX=g++ FC=gfortran CFLAGS='-fPIC -m64' CXXFLAGS='-fPIC -m64' FCFLAGS='-fPIC -m64' --without-verbs --prefix=/Users/mathomp4/installed/Compiler/gcc-gfortran-6.2.0/openmpi/2.0.1 | & tee configure.gcc-gfortran-6.2.0.log
--
-- ]]

family("MPI")
prereq("gcc-gfortran/6.2.0")

local compilername = "gcc-gfortran-6.2.0"

local version = "2.0.1"
local compiler = pathJoin("Compiler",compilername)
local homedir = os.getenv("HOME")
local installdir = pathJoin(homedir,"installed")
local pkgdir = pathJoin(installdir,compiler,"openmpi",version)

-- Setup Modulepath for packages built by this MPI stack
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir = pathJoin(mroot,"MPI/gcc-gfortran-6.2.0",("openmpi-"..version))
prepend_path("MODULEPATH", mdir)

setenv("OPENMPI",pkgdir)
setenv("MPIHOME",pkgdir)
setenv("MPI_HOME",pkgdir)

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("INCLUDE",pathJoin(pkgdir,"include"))
prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))
