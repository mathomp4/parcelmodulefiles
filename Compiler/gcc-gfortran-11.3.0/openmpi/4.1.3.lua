-- [[
--
-- NOTE NOTE NOTE Added new OMPI_MCA flag from https://github.com/open-mpi/ompi/issues/8350
--
-- This was built using:
-- $ mkdir build-gcc-gfortran-11.3.0
-- $ cd build-gcc-gfortran-11.3.0
-- $ ../configure --disable-wrapper-rpath --disable-wrapper-runpath CC=gcc CXX=g++ FC=gfortran --prefix=$HOME/installed/Compiler/gcc-gfortran-11.3.0/openmpi/4.1.3 |& tee configure.gcc-gfortran-11.3.0.log
-- $ mv config.log config.gcc-gfortran-11.3.0.log
-- $ make -j4 |& tee make.gcc-gfortran-11.3.0.log
-- $ make install |& tee makeinstall.gcc-gfortran-11.3.0.log
-- $ make check |& tee makecheck.gcc-gfortran-11.3.0.log
--
-- ]]

family("MPI")
prereq("gcc-gfortran/11.3.0")

local compilername = "gcc-gfortran-11.3.0"

local version = "4.1.3"
local compiler = pathJoin("Compiler",compilername)
local homedir = os.getenv("HOME")
local installdir = pathJoin(homedir,"installed")
local pkgdir = pathJoin(installdir,compiler,"openmpi",version)

-- Setup Modulepath for packages built by this MPI stack
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir = pathJoin(mroot,"MPI/gcc-gfortran-11.3.0",("openmpi-"..version))
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

-- setenv("OMPI_MCA_btl_tcp_if_include","lo0")
setenv("OMPI_MCA_io","romio321")
setenv("OMPI_MCA_btl","^tcp")
