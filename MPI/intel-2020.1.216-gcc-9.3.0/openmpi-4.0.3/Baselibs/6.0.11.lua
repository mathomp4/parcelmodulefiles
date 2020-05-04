-- [[
--
-- NOTE NOTE NOTE Always do this in a new terminal. Old geostag can leave behind remnants of other Baselib bin paths
--                which can blow up a build
--
-- This was built using:
-- $ make -j4 install ESMF_COMM=openmpi ESMF_COMPILER=intelgcc prefix=$HOME/installed/MPI/intel-2020.1.216-gcc-9.3.0/openmpi-4.0.3/Baselibs/6.0.11/Darwin |& tee makeinstall.intel-2020.1.216-gcc-9.3.0_openmpi-4.0.3.log
--
-- ]]

family("Baselibs")
-- prereq("GMAOpyD", "intel-gcc/2020.1.216-9.3.0", "openmpi/4.0.3")

local compilername = "intel-2020.1.216-gcc-9.3.0"
local mpiname = "openmpi-4.0.3"

local version = "6.0.11"
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

