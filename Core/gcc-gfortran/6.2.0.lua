-- stub routine for gcc-gfortran 6.2.0 --
-- built with:
-- ../gcc-6.2.0/configure --prefix=/Users/mathomp4/installed/Core/gcc-gfortran/6.2.0 --enable-languages=c,c++,fortran --disable-multilib | & tee configure.log
--

family("Compiler")

local version = "6.2.0"
local installdir = "/Users/mathomp4/installed/Core/gcc-gfortran"
local pkgdir = pathJoin(installdir,version)
local bindir = pathJoin(pkgdir,"bin")

-- Setup Modulepath for packages built by this compiler
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir  = pathJoin(mroot,"Compiler/gcc-gfortran-6.2.0")
prepend_path("MODULEPATH", mdir)

setenv("CC",pathJoin(bindir,"gcc"))
setenv("CXX",pathJoin(bindir,"g++"))
setenv("FC",pathJoin(bindir,"gfortran"))
setenv("F90",pathJoin(bindir,"gfortran"))
setenv("ESMA_FC","gfortran")

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("INCLUDE",pathJoin(pkgdir,"include"))
prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))
