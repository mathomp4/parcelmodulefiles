-- stub routine for gfortran 6.1.0 --

family("Compiler")

local version = "6.1.0"
local pkgdir = "/usr/local/bin"

-- Setup Modulepath for packages built by this compiler
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir  = pathJoin(mroot,"Compiler/clang-gfortran-6.1.0")
prepend_path("MODULEPATH", mdir)

setenv("CC",pathJoin(pkgdir,"gcc"))
setenv("CXX",pathJoin(pkgdir,"g++"))

setenv("FC",pathJoin(pkgdir,"gfortran"))
setenv("F90",pathJoin(pkgdir,"gfortran"))

setenv("ESMA_FC","gfortran")
