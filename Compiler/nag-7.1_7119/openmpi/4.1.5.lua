-- [[
--
-- NOTE NOTE NOTE
--
-- You *MUST* run:
--
--   $ unset MACOSX_DEPLOYMENT_TARGET
--
-- to avoid the -dynamiclib not allowed error
--
-- This is because MACOSX_DEPLOYMENT_TARGET triggers a bad codepath
-- inside the configure script
--
-- No longer need mismatch all for 7.1
--
-- -----------
--
-- This was built using:
--
-- $ mkdir build-nag-7.1_7119 && cd build-nag-7.1_7119
-- $ ../configure --disable-wrapper-rpath --disable-wrapper-runpath \
--     --prefix=$HOME/installed/Compiler/nag-7.1_7119/openmpi/4.1.5 |& tee configure.nag-7.1_7119.log
--
-- $ mv config.log config.nag-7.1_7119.log
-- $ make -j4 |& tee make.nag-7.1_7119.log
-- $ make install |& tee makeinstall.nag-7.1_7119.log
-- $ make check |& tee makecheck.nag-7.1_7119.log
--
-- ]]

family("MPI")
prereq("nag/7.1_7119")

local compilername = "nag-7.1_7119"

local version = "4.1.5"
local compiler = pathJoin("Compiler",compilername)
local homedir = os.getenv("HOME")
local installdir = pathJoin(homedir,"installed")
local pkgdir = pathJoin(installdir,compiler,"openmpi",version)

-- Setup Modulepath for packages built by this MPI stack
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir = pathJoin(mroot,"MPI/nag-7.1_7119",("openmpi-"..version))
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
