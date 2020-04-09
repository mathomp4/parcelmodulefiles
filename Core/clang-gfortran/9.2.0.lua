-- stub routine for gfortran 9.2.0 with clang --

family("Compiler")

local version = "9.2.0"
local homedir = os.getenv("HOME")
local fpkgdir = pathJoin(homedir,"installed/Core/gcc-gfortran/9.2.0-usingclang-Catalina/bin")
local cpkgdir = "/usr/bin"

-- Setup Modulepath for packages built by this compiler
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir  = pathJoin(mroot,"Compiler/clang-gfortran-9.2.0")
prepend_path("MODULEPATH", mdir)

-- setenv("CC",pathJoin(cpkgdir,"gcc"))
-- setenv("CC",pathJoin(cpkgdir,"gcc"))

setenv("CC",pathJoin(cpkgdir,"clang"))
setenv("CXX",pathJoin(cpkgdir,"clang++"))

setenv("FC",pathJoin(fpkgdir,"gfortran"))
setenv("F90",pathJoin(fpkgdir,"gfortran"))

setenv("ESMA_FC","gfortran")
