-- File for anaconda
--
-- Installed using the Anaconda2 installer script on github:
--
--   git@github.com:mathomp4/anaconda.git
--

family("Python")

local homedir = os.getenv("HOME")
local installdir = pathJoin(homedir,"anaconda")

local anaconda_version = "5.3.1"
local python_version = "3.7"
local builddate = "2018-12-06"

local pathdir = pathJoin(anaconda_version,python_version,builddate)
local pkgdir = pathJoin(installdir,pathdir)

-- Setup Modulepath for packages built by this compiler
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir  = pathJoin(mroot,"Python/Anaconda3-5.3.1")
prepend_path("MODULEPATH", mdir)

unsetenv("ESMA_F2PY")

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("PROJ_LIB",pathJoin(pkgdir,"share/proj"))
