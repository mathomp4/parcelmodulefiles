--
-- stub routine for pgi 17.4 --
--

family("Compiler")

local homedir = os.getenv("HOME")

local pgi_version = "17.4"
--local installdir = pathJoin(homedir,"installed/Core/pgi")
local pgi_installdir = "/opt/pgi/osx86-64"
local pgi_pkgdir = pathJoin(pgi_installdir,pgi_version)

local gcc_version = "6.3.0"
local gcc_installdir = pathJoin(homedir,"installed/Core/gcc-gfortran")
local gcc_pkgdir = pathJoin(gcc_installdir,gcc_version)

-- Setup Modulepath for packages built by this compiler
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir  = pathJoin(mroot,"Compiler/pgi-gcc-17.4-6.3.0")
prepend_path("MODULEPATH", mdir)

setenv("CC",pathJoin(gcc_pkgdir,"gcc"))
setenv("CXX",pathJoin(gcc_pkgdir,"gc++"))
setenv("FC",pathJoin(pgi_pkgdir,"pgfortran"))
setenv("F90",pathJoin(pgi_pkgdir,"pgfortran"))
setenv("ESMA_FC","pgfortran")
unsetenv("CPP")

setenv("LM_LICENSE_FILE","/opt/pgi/license.dat-COMMUNITY-17.4")

prepend_path("PATH",pathJoin(gcc_pkgdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(gcc_pkgdir,"lib"))
prepend_path("LIBRARY_PATH",pathJoin(gcc_pkgdir,"lib"))
prepend_path("INCLUDE",pathJoin(gcc_pkgdir,"include"))
prepend_path("MANPATH",pathJoin(gcc_pkgdir,"share/man"))

prepend_path("PATH",pathJoin(pgi_pkgdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(pgi_pkgdir,"lib"))
prepend_path("LIBRARY_PATH",pathJoin(pgi_pkgdir,"lib"))
prepend_path("INCLUDE",pathJoin(pgi_pkgdir,"include"))
prepend_path("MANPATH",pathJoin(pgi_pkgdir,"man"))

