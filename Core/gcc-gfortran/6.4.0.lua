-- stub routine for gcc-gfortran 6.4.0 --
-- built with:
-- First in the source, run edit ./contrib/download_prerequisites and change wget to curl -O
-- Next, run contrib/download_prerequisites
-- Also run contrib/download_ecj
--
-- Then, in a build directory:
--
-- ../gcc-6.4.0/configure --prefix=/Users/mathomp4/installed/Core/gcc-gfortran/6.4.0 --enable-languages=c,c++,fortran --disable-multilib | & tee configure.log
--

family("Compiler")

local version = "6.4.0"
local installdir = "/Users/mathomp4/installed/Core/gcc-gfortran"
local pkgdir = pathJoin(installdir,version)

-- Setup Modulepath for packages built by this compiler
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir  = pathJoin(mroot,"Compiler/gcc-gfortran-6.4.0")
prepend_path("MODULEPATH", mdir)

setenv("CC",pathJoin(pkgdir,"gcc"))
setenv("CXX",pathJoin(pkgdir,"g++"))
setenv("FC",pathJoin(pkgdir,"gfortran"))
setenv("F90",pathJoin(pkgdir,"gfortran"))
setenv("ESMA_FC","gfortran")

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("INCLUDE",pathJoin(pkgdir,"include"))
prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))
