--
-- stub routine for pgi 17.4 --
--

family("Compiler")

local version = "17.4"
--local installdir = "/Users/mathomp4/installed/Core/pgi"
local installdir = "/opt/pgi/osx86-64"
local pkgdir = pathJoin(installdir,version)

-- Setup Modulepath for packages built by this compiler
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir  = pathJoin(mroot,"Compiler/pgi-17.4")
prepend_path("MODULEPATH", mdir)

setenv("CC",pathJoin(pkgdir,"pgcc"))
setenv("CXX",pathJoin(pkgdir,"pgc++"))
setenv("FC",pathJoin(pkgdir,"pgfortran"))
setenv("F90",pathJoin(pkgdir,"pgfortran"))
setenv("ESMA_FC","pgfortran")
unsetenv("CPP")

setenv("LM_LICENSE_FILE","/opt/pgi/license.dat-COMMUNITY-17.4")

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("INCLUDE",pathJoin(pkgdir,"include"))
prepend_path("MANPATH",pathJoin(pkgdir,"man"))
