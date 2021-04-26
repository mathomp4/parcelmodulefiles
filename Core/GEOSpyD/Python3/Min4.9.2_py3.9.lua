-- File for GEOSpyD
--
-- Installed using the Anaconda installer script on github:
--
--   git@github.com:mathomp4/anaconda.git
--

family("Python3")

local homedir = os.getenv("HOME")
local installdir = pathJoin(homedir,"GEOSpyD")

local miniconda_version = "4.9.2"
local python_version = "3.9"
local geospyd_version = miniconda_version .. "_py" .. python_version
local builddate = "2021-03-31"

local pathdir = pathJoin(geospyd_version,builddate)
local pkgdir = pathJoin(installdir,pathdir)

-- Setup Modulepath for packages built by this compiler
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir  = pathJoin(mroot,"Python3/GEOSpyD",geospyd_version)
prepend_path("MODULEPATH", mdir)

unsetenv("ESMA_F2PY")

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("PROJ_LIB",pathJoin(pkgdir,"share/proj"))
prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))
