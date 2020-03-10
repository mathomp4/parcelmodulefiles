-- [[
-- This was built using:
-- $ make -j4 install ESMF_COMM=mpich3 ESMF_COMPILER=pgi CC=pgcc CXX=pgc++ prefix=$HOME/installed/MPI/pgi-18.4/mpich-3.2.1/Baselibs/5.1.3/Darwin
--
-- ]]

family("Baselibs")
--prereq("pgi/18.4", "mpich/3.2.1")

local compilername = "pgi-18.4"
local mpiname = "mpich-3.2.1"

local version = "5.1.3"
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

