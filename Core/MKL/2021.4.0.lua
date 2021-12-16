-- File for MKL
--

family("Math")

local version = "2021.4.0"
local pkgdir = pathJoin("/opt/intel/oneapi/mkl",version)

-- Setup Modulepath for packages built by this compiler
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir  = pathJoin(mroot,"Math/MKL-2021.4.0")
prepend_path("MODULEPATH", mdir)

setenv('MKLROOT',pkgdir)
setenv('MKLPATH',pathJoin(pkgdir,"lib"))

prepend_path("PATH",pathJoin(pkgdir,"bin"))
-- prepend_path("MANPATH",pathJoin(pkgdir,"man"))
prepend_path("LD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("DYLD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
