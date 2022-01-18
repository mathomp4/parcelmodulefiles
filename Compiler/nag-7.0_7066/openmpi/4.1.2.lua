-- [[
--
-- For reasons I don't know, I all of the sudden needed to build this as a static library. If shared, it complained that '-dynamiclib' (a clang flag) was being passed to nagfor which can't handle it.
--
-- This was built using:
--
-- $ mkdir build-nag-7.0_7066
-- $ cd build-nag-7.0_7066
-- $ ../configure --disable-wrapper-rpath --disable-wrapper-runpath --enable-static -disable-shared FCFLAGS"=-mismatch_all -fpp" CC=gcc CXX=g++ FC=nagfor --prefix=$HOME/installed/Compiler/nag-7.0_7066/openmpi/4.1.2 |& tee configure.nag-7.0_7066.log
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

local version = "4.1.2"
local compiler = pathJoin("Compiler",compilername)
local homedir = os.getenv("HOME")
local installdir = pathJoin(homedir,"installed")
local pkgdir = pathJoin(installdir,compiler,"openmpi",version)

-- Setup Modulepath for packages built by this MPI stack
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir = pathJoin(mroot,"MPI/nag-7.0_7066",("openmpi-"..version))
prepend_path("MODULEPATH", mdir)

setenv("OPENMPI",pkgdir)
setenv("MPIHOME",pkgdir)
setenv("MPI_HOME",pkgdir)

-- OpenMPI has a bug on macOS that requires a short TMPDIR (if it's
-- too long, mpirun fails)
setenv("TMPDIR","/tmp")

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("DYLD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("INCLUDE",pathJoin(pkgdir,"include"))
prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))

-- setenv("OMPI_MCA_btl_tcp_if_include","lo0")
setenv("OMPI_MCA_btl","^tcp")
