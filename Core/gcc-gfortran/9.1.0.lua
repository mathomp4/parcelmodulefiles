-- stub routine for gcc-gfortran 9.1.0 --
-- built with:
--
-- First in the source, if you don't have wget, 
--     edit ./contrib/download_prerequisites and change wget to curl -O
-- Next, run contrib/download_prerequisites
--
-- NOTE: Due to some bug with clang, I could not build 9.1.0 with clang. Instead I did:
--
-- ml gcc-gfortran/8.2.0
--
-- and then built with that loaded.
--
-- Then, in a build directory:
--
-- ../gcc-9.1.0/configure --prefix=/Users/mathomp4/installed/Core/gcc-gfortran/9.1.0-820loaded --enable-languages=c,c++,fortran --disable-multilib |& tee configure.log
-- make -j4 |& tee make.log
-- make install |& tee makeinstall.log
-- make check |& tee makecheck.log
--

family("Compiler")

local version = "9.1.0-820loaded"
local installdir = "/Users/mathomp4/installed/Core/gcc-gfortran"
local pkgdir = pathJoin(installdir,version)
local bindir = pathJoin(pkgdir,"bin")

-- Setup Modulepath for packages built by this compiler
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir  = pathJoin(mroot,"Compiler/gcc-gfortran-9.1.0")
prepend_path("MODULEPATH", mdir)

setenv("CC",pathJoin(bindir,"gcc"))
setenv("CXX",pathJoin(bindir,"g++"))
setenv("FC",pathJoin(bindir,"gfortran"))
setenv("F90",pathJoin(bindir,"gfortran"))
setenv("ESMA_FC","gfortran")

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("DYLD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("INCLUDE",pathJoin(pkgdir,"include"))
prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))
