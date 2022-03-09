# Collection of modulefiles created on Parcel

## Using with lmod

If you install `lmod` with brew, then this is how I am getting the modulefiles into my environment:

```
. $(brew --prefix)/opt/lmod/init/zsh
export MODULEPATH_ROOT=$HOME/modulefiles
module use $MODULEPATH_ROOT/Core
```

where the `MODULEPATH_ROOT` points to where you install your module files.

Note: This assumes that you have your path set up *before* this so that `brew --prefix` can work. You can also just hard code in that path (say `/usr/local/` or `$HOME/.homebrew`.
