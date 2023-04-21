-- stub routine for Intel 2023.1.0 with clang --
--
-- I installed TBB, IPP, and MKL from the Base image
--
-- REMEMBER TO HAVE GMAO SUPPORT REMOVE INTEL SYMLINKS
-- IN /usr/local/bin OTHERWISE BASELIBS IS NOT HAPPY
--

family("Compiler")

local version = "2023.1.0"
local homedir = "/opt/intel/oneapi"
local fpkgdir = pathJoin(homedir,"compiler",version,"mac")
local fbindir = pathJoin(fpkgdir,"bin/intel64")

local fdocdir = pathJoin(homedir,"compiler",version,"documentation/en/man/common")

local cpkgdir = "/usr/bin"

-- Setup Modulepath for packages built by this compiler
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir  = pathJoin(mroot,"Compiler/intel-clang-"..version)
prepend_path("MODULEPATH", mdir)

setenv("CC",pathJoin(cpkgdir,"clang"))
setenv("CXX",pathJoin(cpkgdir,"clang++"))

setenv("FC",pathJoin(fbindir,"ifort"))
setenv("F90",pathJoin(fbindir,"ifort"))

prepend_path("PATH",fbindir)
prepend_path("DYLD_LIBRARY_PATH",pathJoin(fpkgdir,"compiler/lib"))
prepend_path("INCLUDE_PATH",pathJoin(fpkgdir,"compiler/include"))
prepend_path("MANPATH",fdocdir)

-- MAT: Note it looks like 2022.0 does need this again
--
--   To test this, use hyperfine. With the hack:
--
--     ❯ hyperfine 'ifort blank.F90' -w 10
--     Benchmark 1: ifort blank.F90
--     Time (mean ± σ):     286.4 ms ±   8.8 ms    [User: 142.0 ms, System: 134.7 ms]
--     Range (min … max):   270.5 ms … 295.3 ms    10 runs
--
--   Without:
--
--     ❯ hyperfine 'ifort blank.F90' -w 10
--     Benchmark 1: ifort blank.F90
--     Time (mean ± σ):      1.607 s ±  0.223 s    [User: 1.038 s, System: 0.633 s]
--     Range (min … max):    1.457 s …  2.033 s    10 runs
--
-- local sdk_version = subprocess("xcodebuild -sdk macosx -version | grep SDKVersion")
-- setenv("INTEL_OSXSDK_VER",sdk_version)
-- -- 
-- local sdk_path = subprocess("xcodebuild -sdk macosx -version Path")
-- setenv("INTEL_OSXSDK_PATH",sdk_path)
-- -- 
-- prepend_path("PATH",pathJoin(os.getenv("HOME"),"intelhack"))
