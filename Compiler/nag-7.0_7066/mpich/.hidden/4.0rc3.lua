-- [[
--
-- NOTE NOTE NOTE
--
-- This fails with the -dynamiclib error. I can't seem to work around it like I could Open MPI
--
-- This was built using:
--
-- $ unset F90
-- $ mkdir build-nag-7.0_7066
-- $ cd build-nag-7.0_7066
-- $ ../configure FCFLAGS="-mismatch_all -fpp" FFLAGS="-mismatch_all -fpp" --prefix=$HOME/installed/Compiler/nag-7.0_7066/mpich/4.0rc3 |& tee configure.nag-7.0_7066.log 
--
-- $ mv config.log config.nag-7.0_7066.log
-- $ make -j4 |& tee make.nag-7.0_7066.log
-- $ make install |& tee makeinstall.nag-7.0_7066.log
-- $ make check |& tee makecheck.nag-7.0_7066.log
--
-- ]]

family("MPI")
prereq("nag/7.0_7066")

local compilername = "nag-7.0_7066"

local version = "4.0rc3"
local compiler = pathJoin("Compiler",compilername)
local homedir = os.getenv("HOME")
local installdir = pathJoin(homedir,"installed")
local pkgdir = pathJoin(installdir,compiler,"mpich",version)

-- Setup Modulepath for packages built by this MPI stack
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir = pathJoin(mroot,"MPI/nag-7.0_7066",("mpich-"..version))
prepend_path("MODULEPATH", mdir)

setenv("MPICH",pkgdir)
setenv("MPIHOME",pkgdir)
setenv("MPI_HOME",pkgdir)

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("DYLD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("INCLUDE",pathJoin(pkgdir,"include"))
prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))
