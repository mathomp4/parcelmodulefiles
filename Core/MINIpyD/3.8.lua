-- File for MINIpyD
--
-- Installed using the Anaconda installer script on github:
--
--   git@github.com:mathomp4/anaconda.git
--

family("Python")

local homedir = os.getenv("HOME")
local installdir = pathJoin(homedir,"MINIpyD")

local anaconda_version = "latest"
local python_version = "3.8"
local minipyd_version = anaconda_version .. "_py" .. python_version
local builddate = "2020-07-30"

local pathdir = pathJoin(minipyd_version,builddate)
local pkgdir = pathJoin(installdir,pathdir)

-- Setup Modulepath for packages built by this compiler
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir  = pathJoin(mroot,"Python/MINIpyD",minipyd_version)
prepend_path("MODULEPATH", mdir)

unsetenv("ESMA_F2PY")

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("PROJ_LIB",pathJoin(pkgdir,"share/proj"))
