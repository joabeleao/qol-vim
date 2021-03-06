#!/bin/sh
#
# Inspired by:
# https://github.com/willyrgf/vimfiles

OS="$(uname -s | tr 'A-Z' 'a-z')"

requisites() {

    dependencies="nvim git curl pip3"

    for dep in $(echo "${dependencies}" | xargs -n 1) ; do
        if ! command -v "${dep}" 2> /dev/null; then
            echo "package ${dep} is not found"
            return 1
        fi
    done
}

install() {

    # needed directories
    mkdir -p ~/.vim
    mkdir -p ~/.config/nvim

    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

    # Install support for python plugins
    pip3 install pynvim

    # copy vim init
    if ! cp -av src/init.vim* ~/.config/nvim/; then
        echo "error on copy vim init file to home"
        return 1
    fi

    # Powerline fonts for a arrow shaped tabline
    git clone https://github.com/powerline/fonts.git --depth=1
    # install
    cd fonts
    ./install.sh
    # clean-up a bit
    cd ..
    rm -rf fonts

    if ! nvim +:PlugInstall +q +q && nvim +:VimBootstrapUpdate +q +q; then
        echo "Error installing vim plugins. Please check."
        return 1
    fi

    if ! nvim +:UpdateRemotePlugins +q +q; then
        echo "Error updating plugins. Please check."
        return 1
    fi

    if ! mkdir -p ~/.vim/backup/; then
        echo "Error creating vim backup directory. Please check."
        return 1
    fi
}

main() {
    requisites &&
        install
}

main
