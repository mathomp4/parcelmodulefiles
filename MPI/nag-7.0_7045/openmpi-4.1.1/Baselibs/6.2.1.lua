-- [[
--
-- This was built using:
-- $ make -j4 install ESMF_COMM=openmpi ESMF_COMPILER=nag prefix=$HOME/installed/MPI/nag-7.0_7045/openmpi-4.1.1/Baselibs/6.2.1/Darwin |& tee makeinstall.nag-7.0_7045_openmpi-4.1.1.log
--
-- NOTE: To build curl on Parcel, I had to do:
--
--   brew install automake autoconf libtool
--
-- then I had to make symlinks so that it could find these:
--
--   ln -s $(brew --prefix)/bin/automake $HOME/bin/automake
--   ln -s $(brew --prefix)/bin/aclocal $HOME/bin/aclocal
--   ln -s $(brew --prefix)/bin/glibtool $HOME/bin/libtool
--
-- NOTE THE LAST ONE! Brew installs glibtool, so as not to collide with clang libtool
-- ]]

family("Baselibs")
--prereq("nag/7.0_7045", "openmpi/4.1.1")

local compilername = "nag-7.0_7045"
local mpiname = "openmpi-4.1.1"

local version = "6.2.1"
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

