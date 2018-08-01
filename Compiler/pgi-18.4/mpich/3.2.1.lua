-- [[
-- This uses the built-in MPICH from PGI
-- ]]

family("MPI")
prereq("pgi/18.4")

local compilername = "pgi-18.4"
local compilerversion = "18.4"

local version = "3.2.1"
local compiler = pathJoin("Compiler",compilername)
local homedir = os.getenv("HOME")
--local installdir = pathJoin(homedir,"installed")
local installdir = "/opt/pgi/osx86-64"
local pkgdir = pathJoin(installdir,compilerversion,'mpi/mpich')

-- Setup Modulepath for packages built by this MPI stack
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir = pathJoin(mroot,"MPI/pgi-18.4",("mpich-"..version))
prepend_path("MODULEPATH", mdir)

setenv("MPICH3",pkgdir)
setenv("MPIHOME",pkgdir)
setenv("MPI_HOME",pkgdir)

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("INCLUDE",pathJoin(pkgdir,"include"))
prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))
