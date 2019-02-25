--
-- stub routine for nag 6.2 --
--

family("Compiler")

local nag_pkgdir = "/opt/nag/"
local nag_bindir = pathJoin(nag_pkgdir,"bin")
-- local nag_libdir = pathJoin(nag_pkgdir,"lib")
local nag_libdir = pathJoin(nag_pkgdir,"lib/NAG_Fortran")
local nag_mandir = pathJoin(nag_pkgdir,"man")
-- local nag_incdir = pathJoin(nag_pkgdir,"lib/NAG_Fortran")

-- Setup Modulepath for packages built by this compiler
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir  = pathJoin(mroot,"Compiler/nag-6.2")
prepend_path("MODULEPATH", mdir)

setenv("CC","gcc")
setenv("CXX","g++")
setenv("FC",pathJoin(nag_bindir,"nagfor"))
setenv("F90",pathJoin(nag_bindir,"nagfor"))
setenv("ESMA_FC","nagfor")

prepend_path("PATH",nag_bindir)
prepend_path("DYLD_LIBRARY_PATH",nag_libdir)
prepend_path("LD_LIBRARY_PATH",nag_libdir)
prepend_path("LIBRARY_PATH",nag_libdir)
--prepend_path("INCLUDE",nag_incdir)
prepend_path("MANPATH",nag_mandir)

setenv("NAG_KUSARI_FILE","/Users/mathomp4/nag.key")

