-- stub routine for gfortran 6.1.0 --

family("Compiler")

local version = "6.3.0"
local fpkgdir = "/usr/local/bin"
local cpkgdir = "/usr/bin"

-- Setup Modulepath for packages built by this compiler
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir  = pathJoin(mroot,"Compiler/clang-gfortran-6.3.0")
prepend_path("MODULEPATH", mdir)

setenv("CC",pathJoin(cpkgdir,"gcc"))
setenv("CXX",pathJoin(cpkgdir,"g++"))

setenv("FC",pathJoin(fpkgdir,"gfortran"))
setenv("F90",pathJoin(fpkgdir,"gfortran"))

setenv("ESMA_FC","gfortran")
