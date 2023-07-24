-- File for GEOSpyD
--
-- Installed using the installer script on github:
--
--   git@github.com:GMAO-SI-Team/GEOSpyD.git
--
-- and I ran
-- 
--   ./install_miniconda.bash --python_version 3.10 --miniconda_version 23.3.1-0 --prefix /Users/mathomp4/installed/Core/GEOSpyD |& tee install.23.3.1-0_py3.10.log
--
-- NOTE: You'll need to set the date below!
--

family("Python3")

local homedir = os.getenv("HOME")
local installdir = pathJoin(homedir,"installed/Core/GEOSpyD")

local miniconda_version = "23.3.1-0"
local python_version = "3.10"
local geospyd_version = miniconda_version .. "_py" .. python_version
local builddate = "2023-07-14"

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
