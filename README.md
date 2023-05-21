# installing neovim
How to install my neovim configuration.

## content

<!--toc:start-->
- [installing neovim](#installing-neovim)
  - [content](#content)
  - [Prerequisites](#prerequisites)
    - [Packages for build](#packages-for-build)
    - [Packages usefull for neovim](#packages-usefull-for-neovim)
    - [Packages to install for LSP](#packages-to-install-for-lsp)
  - [install](#install)
  - [LSP modules](#lsp-modules)
  - [Checks](#checks)
  - [package managers and distro's](#package-managers-and-distros)
    - [use AstroNvim, LazyVim or NvChad](#use-astronvim-lazyvim-or-nvchad)
  - [file locations](#file-locations)
  - [links](#links)
<!--toc:end-->

## Prerequisites

### Packages for build

install the following packages:

- `cmake`  
- `automake` 

If above does not suffice check [prerequisites at neovim website](https://github.com/neovim/neovim/wiki/Building-Neovim#build-prerequisites)


### Packages usefull for neovim

- `xclip` (on x11 linux, to make copy/paste work between os and neovim).
- `wl-copy` and `wl-paste` if using Wayland.

### Packages to install for LSP

Via `mgpak` (package installer`):`

- `node` or `npm`
- `prettier` or `npm install --save-dev --save-exact prettier`
- `stylua`
- `black` or `pip install black`
- `ripgrep`
- `fd` (or download from [shardp/fd](https://github.com/sharkdp/fd))

`pip` can be installed with `python3-pip`

Node packages:

- `npm i -g neovim`

Python packages:

- `pip install pynvim`

Go:

- `go install golang.org/x/tools/gopls@latest`

Manual install

- [marksman](https://github.com/artempyanykh/marksman)

## install

Start in directory `~/.config/nvim`. If not present, create this directory from the repo and `cd` into it:

    cd ~/.config
    git clone git@bitbucket.org:giel/neovim.git nvim
    cd nvim

If previous installation existed, clean caches:

    clean_nvim_caches.sh

Build the `nvim` binary from scratch, or redo a build

    install_nvim_from_src_build.sh

Install the build, this will ask for `sudo` password:

    install_nvim_from_src_install.sh

Remove the source and build files:

    install_nvim_from_src_remove_build_files.sh

Installed will be in the following locations:

    /usr/local/share/man/man1/nvim.1
    /usr/local/bin/nvim
    /usr/local/lib/nvim/
    /usr/local/share/locale/ja.euc-jp/LC_MESSAGES/nvim.mo
    ....
    /usr/local/share/locale/cs.cp1250/LC_MESSAGES/nvim.mo
    /usr/local/share/locale/tr/LC_MESSAGES/nvim.mo
    /usr/local/share/nvim/

The binaries (see above) can be removed with the following command:

    uninstall_nvim_installed_binaries.sh

Now startup `nvim`, it should download all needed packages. Maybe exit it once and startup again.

    nvim
    :q!
    nvim
    :q!

## LSP modules

LSP modules are installed with `Mason`. Add the desired module to the servers list in the file `lsp\mason.lua`. Keep the list sorted.

## Checks
To check how all is installed and ho healthy your neovim installation is:

    :checkhealth

The `space-a` will bring up start menu. Choose `l` to bring up the package manager.

## package managers and distro's

The new package manager `lazy` is getting a lot of attention and for me has replaced `Packer`. 
I created a new branch ` lazy-nvim-plugin-manager` where I am updating the packages to the new package manager.

     git checkout lazy-nvim-plugin-manager   # switch to lazy
     git checkout packer-nvim-plugin-manager # switch to packer
     git checkout master                     # switch to lazy
     git checkout lazyvim                    # switch to lazyvim distro

From neovim 0.9 on it is possible to have several 'distros' in separate directories. 
By switching one environment variable `NVIM_APPNAME` you can choose which one to use.
This setup will replace the separate branches for distro's.


### use AstroNvim, LazyVim or NvChad

Aliases starting with `nvim-set-` can set a distrobution as a default. `nvim-unset` resets the nvim command to the default nvim. The actual commands behind it are shown below.

     export NVIM_APPNAME=nvim-AstroVim
     nvim 

     export NVIM_APPNAME=nvim-LazyVim
     nvim

     export NVIM_APPNAME=nvim-NvChad
     nvim

go back to normal nvim, exit session or:

     unset NVIM_APPNAME

Note that the distro's need to be installed in`~/.config/` in the subdirectory used in the `NVIM_APPNAME` variable for this to work.


## file locations

windows 

    C:\Users\g.scharff\AppData\Local\nvim      
    C:\Users\g.scharff\AppData\Local\nvim-data

linux and macOS

    ~/.config/nvim/
    ~/.local/share/nvim/


## links

- [neovim GitHub](https://github.com/neovim/neovim)
- [neovim-basic-ide](https://github.com/LunarVim/nvim-basic-ide)
- [kickstart neovim](https://github.com/nvim-lua/kickstart.nvim)
- [Packer package manager](https://github.com/wbthomason/packer.nvim)
- [lazy package manager](https://github.com/folke/lazy.nvim)
- [LazyVim distro](https://www.lazyvim.org)
- Neovim config switcher [video](https://www.youtube.com/watch?v=LkHjJlSgKZY), 
   and [source](https://gist.github.com/elijahmanor/b279553c0132bfad7eae23e34ceb593b)

