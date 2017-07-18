-- [[
-- This was built using:
-- $ ./configure --disable-wrapper-rpath CC=pgcc CXX=pgc++ FC=pgfortran FCFLAGS='-Mpreprocess -Mbackslash' --prefix=/Users/mathomp4/installed/Compiler/pgi-16.10/openmpi/2.1.0 | & tee configure.pgi-16.10.log
--
-- NOTE NOTE NOTE
-- You also need to have a siterc file like this
--
-- ================================= 
-- siterc for gcc commands PGI does not support 
-- ================================= 
-- switch -ffast-math is hide; 
-- 
-- switch -pipe is hide; 
-- 
-- switch -fexpensive-optimizations is hide; 
-- 
-- switch -pthread is 
-- append(LDLIB1= -lpthread); 
-- 
-- switch -qversion is 
-- early 
-- help(Display compiler version) 
-- helpgroup(overall) 
-- set(VERSION=YES); 
-- 
-- switch -Wno-deprecated-declarations is hide; 
-- 
-- switch -flat_namespace is hide; 
-- ==================================== 
--
-- ]]

family("MPI")
prereq("pgi/16.10")

local compilername = "pgi-16.10"

local version = "2.1.0"
local compiler = pathJoin("Compiler",compilername)
local homedir = os.getenv("HOME")
local installdir = pathJoin(homedir,"installed")
local pkgdir = pathJoin(installdir,compiler,"openmpi",version)

-- Setup Modulepath for packages built by this MPI stack
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir = pathJoin(mroot,"MPI/pgi-16.10",("openmpi-"..version))
prepend_path("MODULEPATH", mdir)

setenv("OPENMPI",pkgdir)
setenv("MPIHOME",pkgdir)
setenv("MPI_HOME",pkgdir)

setenv("TMPDIR","/tmp")

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("INCLUDE",pathJoin(pkgdir,"include"))
prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))
