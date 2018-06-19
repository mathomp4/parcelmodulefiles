-- [[
--
-- This was built using:
-- $ ./configure --disable-wrapper-rpath --disable-wrapper-runpath CC=gcc CXX=g++ FC=gfortran --without-verbs --prefix=/Users/mathomp4/installed/Compiler/gcc-gfortran-7.3.0/openmpi/3.1.0 | & tee configure.gcc-gfortran-7.3.0.log
-- $ mv config.log config.gcc-gfortran-7.3.0.log
-- $ make -j4 |& tee make.gcc-gfortran-7.3.0.log
-- $ make install |& tee makeinstall.gcc-gfortran-7.3.0.log
-- $ make check |& tee makecheck.gcc-gfortran-7.3.0.log
--
-- ]]

family("MPI")
prereq("gcc-gfortran/7.3.0")

local compilername = "gcc-gfortran-7.3.0"

local version = "3.1.0"
local compiler = pathJoin("Compiler",compilername)
local homedir = os.getenv("HOME")
local installdir = pathJoin(homedir,"installed")
local pkgdir = pathJoin(installdir,compiler,"openmpi",version)

-- Setup Modulepath for packages built by this MPI stack
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir = pathJoin(mroot,"MPI/gcc-gfortran-7.3.0",("openmpi-"..version))
prepend_path("MODULEPATH", mdir)

setenv("OPENMPI",pkgdir)
setenv("MPIHOME",pkgdir)
setenv("MPI_HOME",pkgdir)

-- OpenMPI has a bug on macOS that requires a short TMPDIR (if it's
-- too long, mpirun fails)
setenv("TMPDIR","/tmp")

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("DYLD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("INCLUDE",pathJoin(pkgdir,"include"))
prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))
