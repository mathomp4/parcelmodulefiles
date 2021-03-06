-- File for MKL
--

family("Math")

local version = "2020.4.301"
-- local pathdir = pathJoin("Core","Anaconda2",version)
-- local homedir = os.getenv("HOME")
-- local installdir = pathJoin(homedir,"installed")
local pkgdir = pathJoin("/opt/intel/compilers_and_libraries_2020.4.301/mac/mkl")

-- Setup Modulepath for packages built by this compiler
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir  = pathJoin(mroot,"Math/MKL-2020.4.301")
prepend_path("MODULEPATH", mdir)

setenv('MKLROOT',pkgdir)
setenv('MKLPATH',pathJoin(pkgdir,"lib"))

prepend_path("PATH",pathJoin(pkgdir,"bin"))
-- prepend_path("MANPATH",pathJoin(pkgdir,"man"))
prepend_path("LD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("DYLD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
