-- [[
-- This was built using:
-- $ ./configure --disable-wrapper-rpath CC=gcc CXX=g++ FC=pgfortran --without-verbs --prefix=/Users/mathomp4/installed/Compiler/pgi-gcc-17.4-6.3.0/openmpi/2.1.0 | & tee configure.pgi-gcc-17.4-6.3.0.log
--
-- ]]

family("MPI")
prereq("pgi-gcc/17.4-6.3.0")

local compilername = "pgi-gcc-17.4-6.3.0"

local version = "2.1.0"
local compiler = pathJoin("Compiler",compilername)
local homedir = os.getenv("HOME")
local installdir = pathJoin(homedir,"installed")
local pkgdir = pathJoin(installdir,compiler,"openmpi",version)

-- Setup Modulepath for packages built by this MPI stack
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir = pathJoin(mroot,"MPI/pgi-gcc-17.4-6.3.0",("openmpi-"..version))
prepend_path("MODULEPATH", mdir)

setenv("OPENMPI",pkgdir)
setenv("MPIHOME",pkgdir)
setenv("MPI_HOME",pkgdir)

-- OpenMPI has a bug on macOS that requires a short TMPDIR (if it's
-- too long, mpirun fails)
setenv("TMPDIR","/tmp")

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("INCLUDE",pathJoin(pkgdir,"include"))
prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))
