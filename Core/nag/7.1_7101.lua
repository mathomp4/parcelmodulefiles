--
-- stub routine for nag 7.1_7101 --
--
-- To install NAG, you mount the DMG and then cd to it in /Volumes
-- Then run INSTALL.sh and put in *absolute* paths:
--
--  /Users/mathomp4/installed/Core/nag/7.1_7101/bin
--
-- NOTE 1
--
---- Until NAG fixes something on their end, you need to run a command
---- if nagfor is installed in userspace (i.e., you can't change
---- /usr/local/lib)
----
---- You must run:
----
---- install_name_tool -id $HOME/installed/Core/nag/7.1_7101/lib/NAG_Fortran/libf71rts.dylib $HOME/installed/Core/nag/7.1_7101/lib/NAG_Fortran/libf71rts.dylib
----
---- I cannot figure out yet how to make this more generic. I'd think
---- @executable_path should work, but I guess not? Maybe something with
---- @rpath?
--
-- NOTE 2
--
---- Before, I had to run on the command line:
---- 
----  $HOME/installed/Core/nag/7.1_7101/lib/NAG_Fortran/nagfor
----
---- for permissions issues before I could build anything with it. 
---- But now it looks like you need admin rights
--

family("Compiler")

local nag_version = "7.1_7101"
local nag_version_with_name = "nag-" .. nag_version

local homedir = os.getenv("HOME")
local nag_pkgdir = pathJoin(homedir,"installed/Core/nag",nag_version)
local nag_bindir = pathJoin(nag_pkgdir,"bin")
-- local nag_libdir = pathJoin(nag_pkgdir,"lib")
local nag_libdir = pathJoin(nag_pkgdir,"lib/NAG_Fortran")
local nag_mandir = pathJoin(nag_pkgdir,"man")
-- local nag_incdir = pathJoin(nag_pkgdir,"lib/NAG_Fortran")

-- Setup Modulepath for packages built by this compiler
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir  = pathJoin(mroot,"Compiler",nag_version_with_name)
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

