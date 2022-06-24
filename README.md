# installing neovim

How to install my neovim configuration.

## Prerequisites

### Packages for build

install the following packages:

- `cmake`  
- `automake` 

If above does not suffice check [prerequisites at neovim website](https://github.com/neovim/neovim/wiki/Building-Neovim#build-prerequisites)


### Packages to install for LSP

Via `mgpak` (package installer`):`

- `node` or `npm`
- `prettier` or `npm install --save-dev --save-exact prettier`
- `stylua`
- `black` or `pip install black`
- `ripgrep`
- `fd` (or download from [shardp/fd](https://github.com/sharkdp/fd)

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

Build the `nvim` binary from scratch, 

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

Install the LSP modules:

    init_nvim_lsp.sh

## links

- [neovim GitHub](https://github.com/neovim/neovim)
- [neovim-basic-ide](https://github.com/LunarVim/nvim-basic-ide)

