-- [[
--
-- This was built using:
-- $ ./configure --disable-wrapper-rpath --disable-wrapper-runpath CC=clang CXX=clang++ FC=$HOME/installed/Core/gcc-gfortran/10.2.0/bin/gfortran --prefix=$HOME/installed/Compiler/clang-gfortran-10.2.0/openmpi/4.0.5 |& tee configure.clang-gfortran-10.2.0.log
-- $ mv config.log config.clang-gfortran-10.2.0.log
-- $ make -j4 |& tee make.clang-gfortran-10.2.0.log
-- $ make install |& tee makeinstall.clang-gfortran-10.2.0.log
-- $ make check |& tee makecheck.clang-gfortran-10.2.0.log
--
-- ]]

family("MPI")
prereq("clang-gfortran/10.2.0")

local compilername = "clang-gfortran-10.2.0"

local version = "4.0.5"
local compiler = pathJoin("Compiler",compilername)
local homedir = os.getenv("HOME")
local installdir = pathJoin(homedir,"installed")
local pkgdir = pathJoin(installdir,compiler,"openmpi",version)

-- Setup Modulepath for packages built by this MPI stack
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir = pathJoin(mroot,"MPI/clang-gfortran-10.2.0",("openmpi-"..version))
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
