-- [[
--
-- This was built using:
-- $ ./configure --disable-wrapper-rpath --disable-wrapper-runpath --enable-mpi1-compatibility FCFLAGS"=-mismatch_all -fpp" CC=gcc CXX=g++ FC=nagfor --prefix=$HOME/installed/Compiler/nag-gcc-6.2-8.2.0/openmpi/4.0.0-MPI1 |& tee configure.nag-gcc-6.2-8.2.0-MPI1.log
-- $ mv config.log config.nag-gcc-6.2-8.2.0-MPI1.log
-- $ make -j4 |& tee make.nag-gcc-6.2-8.2.0-MPI1.log
-- $ make install |& tee makeinstall.nag-gcc-6.2-8.2.0-MPI1.log
-- $ make check |& tee makecheck.nag-gcc-6.2-8.2.0-MPI1.log
--
-- ]]

family("MPI")
prereq("nag-gcc/6.2-8.2.0")

local compilername = "nag-gcc-6.2-8.2.0"

local version = "4.0.0-MPI1"
local compiler = pathJoin("Compiler",compilername)
local homedir = os.getenv("HOME")
local installdir = pathJoin(homedir,"installed")
local pkgdir = pathJoin(installdir,compiler,"openmpi",version)

-- Setup Modulepath for packages built by this MPI stack
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir = pathJoin(mroot,"MPI/nag-gcc-6.2-8.2.0",("openmpi-"..version))
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

setenv("OMPI_MCA_btl_tcp_if_include","lo0")
