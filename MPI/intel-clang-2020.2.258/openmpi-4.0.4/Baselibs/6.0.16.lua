-- [[
-- This was built using:
--
-- $ make -j4 install ESMF_COMM=openmpi ESMF_COMPILER=intelclang prefix=$HOME/installed/MPI/intel-clang-2020.2.258/openmpi-4.0.4/Baselibs/6.0.16/Darwin |& tee makeinstall.intel-clang-2020.2.258_openmpi-4.0.4.log
--
-- ]]

family("Baselibs")
-- prereq("GMAOpyD", "intel-clang/2020.2.258", "openmpi/4.0.4")

local compilername = "intel-clang-2020.2.258"
local mpiname = "openmpi-4.0.4"

local version = "6.0.16"
local pathdir = pathJoin("MPI",compilername,mpiname)
local homedir = os.getenv("HOME")
local installdir = pathJoin(homedir,"installed")
local pkgdir = pathJoin(installdir,pathdir,"Baselibs",version)

-- Setup Modulepath for packages built by this MPI stack
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir = pathJoin(mroot,"Baselibs",compilername,mpiname)
prepend_path("MODULEPATH", mdir)

setenv("BASEDIR",pkgdir)
setenv("basedir",pkgdir)
setenv("BASEBIN",pathJoin(pkgdir,"Darwin/bin"))

prepend_path("PATH",pathJoin(pkgdir,"Darwin/bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(pkgdir,"Darwin/lib"))
prepend_path("DYLD_LIBRARY_PATH",pathJoin(pkgdir,"Darwin/lib"))
prepend_path("MANPATH",pathJoin(pkgdir,"Darwin/share/man"))
