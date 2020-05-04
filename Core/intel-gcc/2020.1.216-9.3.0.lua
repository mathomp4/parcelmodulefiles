-- stub routine for Intel 2020.1.216 with gcc 9.3.0 --

family("Compiler")

-- gcc 9.3.0 --
local gcc_version = "9.3.0"
local gcc_homdir = os.getenv("HOME")
local gcc_installdir = pathJoin(gcc_homdir,"installed/Core/gcc-gfortran")
local gcc_pkgdir = pathJoin(gcc_installdir,gcc_version)
local gcc_bindir = pathJoin(gcc_pkgdir,"bin")

-- intel 2020.1.216 --
local intel_version = "2020.1.216"
local intel_homdir = "/opt/intel"
local intel_pkgdir = pathJoin(intel_homdir,"compilers_and_libraries_"..intel_version,"mac")
local intel_bindir = pathJoin(intel_pkgdir,"bin/intel64")
local intel_docver = "2020"
local intel_docdir = pathJoin(intel_homdir,"documentation_"..intel_docver,"en/man/common")


-- Setup Modulepath for packages built by this compiler
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir  = pathJoin(mroot,"Compiler/intel-"..intel_version.."-gcc-"..gcc_version)
prepend_path("MODULEPATH", mdir)

setenv("CC",pathJoin(gcc_bindir,"gcc"))
setenv("CXX",pathJoin(gcc_bindir,"g++"))
prepend_path("PATH",pathJoin(gcc_pkgdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(gcc_pkgdir,"lib"))
prepend_path("DYLD_LIBRARY_PATH",pathJoin(gcc_pkgdir,"lib"))
prepend_path("LIBRARY_PATH",pathJoin(gcc_pkgdir,"lib"))
prepend_path("INCLUDE",pathJoin(gcc_pkgdir,"include"))
prepend_path("MANPATH",pathJoin(gcc_pkgdir,"share/man"))

setenv("FC",pathJoin(intel_bindir,"ifort"))
setenv("F90",pathJoin(intel_bindir,"ifort"))
prepend_path("PATH",intel_bindir)
prepend_path("DYLD_LIBRARY_PATH",pathJoin(intel_pkgdir,"compiler/lib"))
prepend_path("INCLUDE_PATH",pathJoin(intel_pkgdir,"compiler/include"))
prepend_path("MANPATH",intel_docdir)
