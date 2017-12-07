-- File for anaconda
--
-- Installed using the Anaconda3 commandline installer and pointing it to:
--   /Users/mathomp4/installed/Core/Anaconda3/5.0.1
--

family("Python")

local version = "5.0.1"
local pathdir = pathJoin("Core","Anaconda3",version)
local homedir = os.getenv("HOME")
local installdir = pathJoin(homedir,"installed")
local pkgdir = pathJoin(installdir,pathdir)

-- Setup Modulepath for packages built by this compiler
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir  = pathJoin(mroot,"Python/Anaconda3-5.0.1")
prepend_path("MODULEPATH", mdir)

unsetenv("ESMA_F2PY")

prepend_path("PATH",pathJoin(pkgdir,"bin"))
