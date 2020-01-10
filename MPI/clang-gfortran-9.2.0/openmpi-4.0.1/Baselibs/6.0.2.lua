-- [[
-- This was built using:
-- $ make -j4 install ESMF_COMM=openmpi ESMF_COMPILER=gfortranclang FC=$FC prefix=/Users/mathomp4/installed/MPI/clang-gfortran-9.2.0/openmpi-4.0.1/Baselibs/6.0.2/Darwin |& tee makeinstall.clang-gfortran-9.2.0_openmpi-4.0.1.log
--
-- ]]

family("Baselibs")
-- prereq("GMAOpyD", "clang-gfortran/9.2.0", "openmpi/4.0.1")

local compilername = "clang-gfortran-9.2.0"
local mpiname = "openmpi-4.0.1"

local version = "6.0.2"
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

