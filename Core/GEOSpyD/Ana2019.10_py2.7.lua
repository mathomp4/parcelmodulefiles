-- File for GEOSpyD
--
-- Installed using the Anaconda installer script on github:
--
--   git@github.com:mathomp4/anaconda.git
--

family("Python")

local homedir = os.getenv("HOME")
local installdir = pathJoin(homedir,"GEOSpyD")

local anaconda_version = "2019.10"
local python_version = "2.7"
local geospyd_version = anaconda_version .. "_py" .. python_version
local builddate = "2020-02-13"

local pathdir = pathJoin(geospyd_version,builddate)
local pkgdir = pathJoin(installdir,pathdir)

-- Setup Modulepath for packages built by this compiler
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir  = pathJoin(mroot,"Python/GEOSpyD",geospyd_version)
prepend_path("MODULEPATH", mdir)

unsetenv("ESMA_F2PY")

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("PROJ_LIB",pathJoin(pkgdir,"share/proj"))
