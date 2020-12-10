-- stub routine for clang-flang built from LLVM --
--
-- Built as instructed on:
--
-- https://llvm.org/docs/GettingStarted.html SUPERSEDED BY
-- https://clang.llvm.org/get_started.html
--
-- git clone https://github.com/llvm/llvm-project.git
-- cd llvm-project
-- mkdir build
-- cd build
-- cmake ../llvm -DLLVM_ENABLE_PROJECTS="clang;flang" -DCMAKE_INSTALL_PREFIX=$HOME/installed/Core/clang-flang/2020Dec03 -DLLVM_TARGETS_TO_BUILD="X86" -DCMAKE_BUILD_TYPE=Release
-- make -j6 install |& tee makeinstall.log

family("Compiler")

local version = "2020Dec03"
local homedir = os.getenv("HOME")
local pkgdir = pathJoin(homedir,"installed/Core/clang-flang",version)
local bindir = pathJoin(pkgdir,"bin")

-- Setup Modulepath for packages built by this compiler
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir  = pathJoin(mroot,"Compiler/clang-flang-2020Dec03")
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
