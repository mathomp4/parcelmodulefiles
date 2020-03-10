-- [[
--
-- This was built using:
-- $ make -j4 install ESMF_COMM=openmpi ESMF_COMPILER=gfortran prefix=$HOME/installed/MPI/gcc-gfortran-8.2.0/openmpi-3.1.3/Baselibs/5.2.1/Darwin |& tee makeinstall.gcc-gfortran-8.2.0_openmpi-3.1.3.log
--
-- ]]

family("Baselibs")
--prereq("gcc-gfortran/8.2.0", "openmpi/3.1.3")

local compilername = "gcc-gfortran-8.2.0"
local mpiname = "openmpi-3.1.3"

local version = "5.2.1"
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
