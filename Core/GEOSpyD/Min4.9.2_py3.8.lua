-- File for GEOSpyD
--
-- Installed using the Anaconda installer script on github:
--
--   git@github.com:GMAO-SI-Team/anaconda.git
--
-- to install:
--
--   ./install_miniconda.bash --python_version 3.8 --miniconda_version 4.9.2 --prefix /Users/mathomp4/GEOSpyD |& tee install_mini3.log
--

family("Python")

local homedir = os.getenv("HOME")
local installdir = pathJoin(homedir,"GEOSpyD")

local miniconda_version = "4.9.2"
local python_version = "3.8"
local geospyd_version = miniconda_version .. "_py" .. python_version
local builddate = "2020-12-01"

local pathdir = pathJoin(geospyd_version,builddate)
local pkgdir = pathJoin(installdir,pathdir)

-- Setup Modulepath for packages built by this compiler
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir  = pathJoin(mroot,"Python/GEOSpyD",geospyd_version)
prepend_path("MODULEPATH", mdir)

unsetenv("ESMA_F2PY")

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("PROJ_LIB",pathJoin(pkgdir,"share/proj"))
prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))
