-- [[
--
-- This was built using:
-- $ lt_cv_ld_force_load=no ./configure --disable-wrapper-rpath --disable-wrapper-runpath CC=clang CXX=clang++ FC=ifort --prefix=$HOME/installed/Compiler/intel-clang-2020.4.301/openmpi/4.1.0 |& tee configure.intel-clang-2020.4.301.log
-- $ mv config.log config.intel-clang-2020.4.301.log
-- $ make -j4 |& tee make.intel-clang-2020.4.301.log
-- $ make install |& tee makeinstall.intel-clang-2020.4.301.log
-- $ make check |& tee makecheck.intel-clang-2020.4.301.log
--
-- That weird lt_cv_ld_force_load bit is from https://github.com/open-mpi/ompi/issues/7615 
-- Seems to be an Intel issue.
-- 
-- ]]

family("MPI")
local intel_version = "2020.4.301"
prereq("intel-clang/"..intel_version)

local compilername = "intel-clang-"..intel_version

local version = "4.1.0"
local compiler = pathJoin("Compiler",compilername)
local homedir = os.getenv("HOME")
local installdir = pathJoin(homedir,"installed")
local pkgdir = pathJoin(installdir,compiler,"openmpi",version)

-- Setup Modulepath for packages built by this MPI stack
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir = pathJoin(mroot,"MPI",compilername,("openmpi-"..version))
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
setenv("OMPI_MCA_btl","^tcp")
