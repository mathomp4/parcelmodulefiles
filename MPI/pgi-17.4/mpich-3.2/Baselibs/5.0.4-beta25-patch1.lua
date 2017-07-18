-- [[
-- This was built using:
-- $ make install ESMF_COMM=mpich3 ESMF_COMPILER=pgi CC=pgcc CXX=pgc++ prefix=/Users/mathomp4/installed/MPI/pgi-17.4/mpich-3.2/Baselibs/5.0.4-beta25-patch1/Darwin
--
-- ]]

family("Baselibs")
--prereq("pgi/17.4", "mpich/3.2")

local compilername = "pgi-17.4"
local mpiname = "mpich-3.2"

local version = "5.0.4"
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

