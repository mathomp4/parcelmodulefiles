--
-- stub routine for nag 6.2 --
--

family("Compiler")

local nag_pkgdir = "/opt/nag/"
local nag_bindir = pathJoin(nag_pkgdir,"bin")
local nag_libdir = pathJoin(nag_pkgdir,"lib")
local nag_mandir = pathJoin(nag_pkgdir,"man")
-- local nag_incdir = pathJoin(nag_pkgdir,"lib/NAG_Fortran")

local gcc_version = "8.2.0"
local gcc_installdir = "/Users/mathomp4/installed/Core/gcc-gfortran"
local gcc_pkgdir = pathJoin(gcc_installdir,gcc_version)
local gcc_bindir = pathJoin(gcc_pkgdir,"bin")
local gcc_libdir = pathJoin(gcc_pkgdir,"lib")
local gcc_mandir = pathJoin(gcc_pkgdir,"share/man")
local gcc_incdir = pathJoin(gcc_pkgdir,"include")

-- Setup Modulepath for packages built by this compiler
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir  = pathJoin(mroot,"Compiler/nag-gcc-6.2-8.2.0")
prepend_path("MODULEPATH", mdir)

setenv("CC",pathJoin(gcc_bindir,"gcc"))
setenv("CXX",pathJoin(gcc_bindir,"g++"))
setenv("FC",pathJoin(nag_bindir,"nagfor"))
setenv("F90",pathJoin(nag_bindir,"nagfor"))
setenv("ESMA_FC","nagfor")
unsetenv("CPP")

prepend_path("PATH",gcc_bindir)
prepend_path("DYLD_LIBRARY_PATH",gcc_libdir)
prepend_path("LD_LIBRARY_PATH",gcc_libdir)
prepend_path("LIBRARY_PATH",gcc_libdir)
prepend_path("INCLUDE",gcc_incdir)
prepend_path("MANPATH",gcc_mandir)

prepend_path("PATH",nag_bindir)
prepend_path("DYLD_LIBRARY_PATH",nag_libdir)
prepend_path("LD_LIBRARY_PATH",nag_libdir)
prepend_path("LIBRARY_PATH",nag_libdir)
--prepend_path("INCLUDE",nag_incdir)
prepend_path("MANPATH",nag_mandir)

setenv("NAG_KUSARI_FILE","/Users/mathomp4/nag.key")

