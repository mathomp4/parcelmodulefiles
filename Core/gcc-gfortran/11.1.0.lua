-- stub routine for gcc-gfortran 11.1.0 --
-- built with:
--
-- First in the source, if you don't have wget, 
--     edit ./contrib/download_prerequisites and change wget to curl -O
-- Next, run contrib/download_prerequisites
--
-- NOTE: Decided to follow what homebrew does and add the --with-sysroot option. This seems needed on
--       macOS now
--
-- Then, in a build directory:
--
-- ../gcc-11.1.0/configure --prefix=$HOME/installed/Core/gcc-gfortran/11.1.0 --enable-languages=c,c++,fortran --with-sysroot=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk |& tee configure.log
--
-- make -j4 |& tee make.log
-- make install |& tee makeinstall.log
-- make check |& tee makecheck.log
--

family("Compiler")

local version = "11.1.0"
local homedir = os.getenv("HOME")
local installdir = pathJoin(homedir,"installed/Core/gcc-gfortran")
local pkgdir = pathJoin(installdir,version)
local bindir = pathJoin(pkgdir,"bin")

-- Setup Modulepath for packages built by this compiler
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir  = pathJoin(mroot,"Compiler/gcc-gfortran-11.1.0")
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
