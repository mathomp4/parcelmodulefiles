-- stub routine for Intel 2020.1.216 with clang --

family("Compiler")

local version = "2020.1.216"
local homedir = "/opt/intel"
local fpkgdir = pathJoin(homedir,"compilers_and_libraries_"..version,"mac")
local fbindir = pathJoin(fpkgdir,"bin/intel64")

local docversion = "2020"
local fdocdir = pathJoin(homedir,"documentation_"..docversion,"en/man/common")

local cpkgdir = "/usr/bin"

-- Setup Modulepath for packages built by this compiler
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir  = pathJoin(mroot,"Compiler/intel-clang-"..version)
prepend_path("MODULEPATH", mdir)

setenv("CC",pathJoin(cpkgdir,"clang"))
setenv("CXX",pathJoin(cpkgdir,"clang++"))

setenv("FC",pathJoin(fbindir,"ifort"))
setenv("F90",pathJoin(fbindir,"ifort"))

prepend_path("PATH",fbindir)
prepend_path("DYLD_LIBRARY_PATH",pathJoin(fpkgdir,"compiler/lib"))
prepend_path("INCLUDE_PATH",pathJoin(fpkgdir,"compiler/include"))
prepend_path("MANPATH",fdocdir)
