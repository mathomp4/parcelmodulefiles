-- stub routine for clang-flang built from LLVM --
--
-- Built as instructed on:
--
-- https://llvm.org/docs/GettingStarted.html
--
-- git clone https://github.com/llvm/llvm-project.git
-- cd llvm-project
-- mkdir build
-- cd build
-- cmake -G Ninja ../llvm -DLLVM_ENABLE_PROJECTS="clang;flang" -DCMAKE_INSTALL_PREFIX=/Users/mathomp4/installed/Core/clang-flang/2020-06-24 -DLLVM_TARGETS_TO_BUILD="X86"
-- ninja install

family("Compiler")

local version = "2020-06-24"
local homedir = os.getenv("HOME")
local pkgdir = pathJoin(homedir,"installed/Core/clang-flang",version)
local bindir = pathJoin(pkgdir,"bin")

-- Setup Modulepath for packages built by this compiler
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir  = pathJoin(mroot,"Compiler/clang-flang-2020-06-24")
prepend_path("MODULEPATH", mdir)

setenv("CC",pathJoin(bindir,"clang"))
setenv("CXX",pathJoin(bindir,"clang++"))

setenv("FC",pathJoin(bindir,"flang"))
setenv("F90",pathJoin(bindir,"flang"))

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("DYLD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("INCLUDE",pathJoin(pkgdir,"include"))
prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))
