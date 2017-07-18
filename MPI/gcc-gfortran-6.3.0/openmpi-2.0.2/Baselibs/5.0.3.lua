-- [[
-- This was built using:
-- $ make install ESMF_COMM=openmpi ESMF_COMPILER=gfortran prefix=/Users/mathomp4/installed/MPI/gcc-gfortran-6.3.0/openmpi-2.0.2/Baselibs/5.0.3/Darwin
--
-- ]]

family("Baselibs")
--prereq("gcc-gfortran/6.3.0", "openmpi/2.0.2")

local compilername = "gcc-gfortran-6.3.0"
local mpiname = "openmpi-2.0.2"

local version = "5.0.3"
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
prepend_path("MANPATH",pathJoin(pkgdir,"Darwin/share/man"))

