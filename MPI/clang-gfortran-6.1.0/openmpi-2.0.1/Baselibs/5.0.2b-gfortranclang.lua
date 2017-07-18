-- [[
-- This was built using:
-- $ make install ESMF_COMM=openmpi ESMF_COMPILER=gfortranclang prefix=/Users/mathomp4/installed/MPI/clang-gfortran-6.1.0/openmpi-2.0.1/Baselibs/5.0.2b-gfortranclang/Darwin
--
-- ]]

family("Baselibs")
--prereq("clang-gfortran/6.1.0", "openmpi/2.0.1")

local compilername = "clang-gfortran-6.1.0"
local mpiname = "openmpi-2.0.1"

local version = "5.0.2b-gfortranclang"
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

