-- [[
--
-- This was built using:
--
-- mkdir build-gfortran_10.2.0-openmpi_4.0.4
-- cd build-gfortran_10.2.0-openmpi_4.0.4
-- cmake .. -DCMAKE_INSTALL_PREFIX=$HOME/installed/MPI/gcc-gfortran-10.2.0/openmpi-4.0.4/Baselibs/6.0.16-CMake/Darwin |& tee cmake.log
-- make -j3 install |& tee makeinstall.log
--
-- ]]

family("Baselibs")
--prereq("gcc-gfortran/10.2.0", "openmpi/4.0.4")

local compilername = "gcc-gfortran-10.2.0"
local mpiname = "openmpi-4.0.4"

local version = "6.0.16-CMake"
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

