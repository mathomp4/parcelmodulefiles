-- File for gdb
--
-- mkdir build-clang
-- cd build-clang
-- ../configure --prefix=/Users/mathomp4/installed/Core/gdb/10.1
-- make -j6 |& tee make.log
-- make install |& tee makeinstall.log
--
--

local homedir = os.getenv("HOME")
local installdir = pathJoin(homedir,"installed/Core")

local packagename = "gdb"
local version = "10.1"
local pkgdir = pathJoin(installdir,packagename,version)

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))
