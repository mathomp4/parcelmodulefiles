-- [[
-- This was built using:
-- $ make install ESMF_COMM=mpich3 ESMF_COMPILER=pgi prefix=/Users/mathomp4/installed/MPI/pgi-16.10/mpich-3.2/Baselibs/5.0.2-ESMF7snap13extra/Darwin
--
-- ]]

family("Baselibs")
--prereq("pgi/16.10", "mpich/3.2")

local compilername = "pgi-16.10"
local mpiname = "mpich-3.2"

local version = "5.0.2"
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

