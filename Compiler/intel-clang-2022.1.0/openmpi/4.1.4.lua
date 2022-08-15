-- [[
--
-- This was built using:
--
-- $ mkdir build-intel-clang-2022.1.0 && cd build-intel-clang-2022.1.0
-- $ lt_cv_ld_force_load=no ../configure --disable-wrapper-rpath --disable-wrapper-runpath CC=clang CXX=clang++ FC=ifort --prefix=$HOME/installed/Compiler/intel-clang-2022.1.0/openmpi/4.1.4 |& tee configure.intel-clang-2022.1.0.log
-- $ mv config.log config.intel-clang-2022.1.0.log
-- $ make -j6 |& tee make.intel-clang-2022.1.0.log
-- $ make install |& tee makeinstall.intel-clang-2022.1.0.log
-- $ make check |& tee makecheck.intel-clang-2022.1.0.log
--
-- That weird lt_cv_ld_force_load bit is from https://github.com/open-mpi/ompi/issues/7615 
-- Seems to be an Intel issue.
-- 
-- ]]

family("MPI")
local intel_version = "2022.1.0"
prereq("intel-clang/"..intel_version)

local compilername = "intel-clang-"..intel_version

local version = "4.1.4"
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
-- setenv("OMPI_MCA_io","romio321")
setenv("OMPI_MCA_btl","^tcp")
