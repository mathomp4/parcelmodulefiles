-- stub routine for Intel 2021.1.1 with icc/icpc --
--
-- REMEMBER TO HAVE GMAO SUPPORT REMOVE INTEL SYMLINKS
-- IN /usr/local/bin OTHERWISE BASELIBS IS NOT HAPPY

family("Compiler")

local version = "2021.1.1"
local homedir = "/opt/intel/oneapi"
local pkgdir = pathJoin(homedir,"compiler",version,"mac")
local bindir = pathJoin(pkgdir,"bin/intel64")

local docversion = "2021"
local docdir = pathJoin(homedir,"compiler",version,"documentation/en/man/common")

-- Setup Modulepath for packages built by this compiler
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir  = pathJoin(mroot,"Compiler/intel-"..version)
prepend_path("MODULEPATH", mdir)

setenv("CC",pathJoin(bindir,"icc"))
setenv("CXX",pathJoin(bindir,"icpc"))

setenv("FC",pathJoin(bindir,"ifort"))
setenv("F90",pathJoin(bindir,"ifort"))

prepend_path("PATH",bindir)
prepend_path("DYLD_LIBRARY_PATH",pathJoin(pkgdir,"compiler/lib"))
prepend_path("INCLUDE_PATH",pathJoin(pkgdir,"compiler/include"))
prepend_path("MANPATH",docdir)

local sdk_version = subprocess("xcodebuild -sdk macosx -version | grep SDKVersion")
setenv("INTEL_OSXSDK_VER",sdk_version)

local sdk_path = subprocess("xcodebuild -sdk macosx -version Path")
setenv("INTEL_OSXSDK_PATH",sdk_path)

prepend_path("PATH",pathJoin(os.getenv("HOME"),"intelhack"))

