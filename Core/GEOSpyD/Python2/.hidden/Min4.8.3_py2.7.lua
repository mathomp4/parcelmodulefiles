-- File for GEOSpyD
--
-- Installed using the Anaconda installer script on github:
--
--   git@github.com:mathomp4/anaconda.git
--
-- and I ran
--
--   ./install_miniconda.bash --python_version 2.7 --miniconda_version 4.8.3 --prefix /Users/mathomp4/GEOSpyD --conda
--
-- This then failed because of:
--
--   https://github.com/conda/conda/issues/10361
--
-- So I hand-edited the lib/python2.7/ctypes/util.py a la:
--
--   https://stackoverflow.com/a/65175354/1876449
--
-- and commented out the top of the Miniconda installer script
--
-- NOTE: You'll need to set the date below!
--

family("Python2")

local homedir = os.getenv("HOME")
local installdir = pathJoin(homedir,"GEOSpyD")

local miniconda_version = "4.8.3"
local python_version = "2.7"
local geospyd_version = miniconda_version .. "_py" .. python_version
local builddate = "2021-12-02"

local pathdir = pathJoin(geospyd_version,builddate)
local pkgdir = pathJoin(installdir,pathdir)

-- Setup Modulepath for packages built by this compiler
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir  = pathJoin(mroot,"Python2/GEOSpyD",geospyd_version)
prepend_path("MODULEPATH", mdir)

unsetenv("ESMA_F2PY")

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("PROJ_LIB",pathJoin(pkgdir,"share/proj"))
prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))
