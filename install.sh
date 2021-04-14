#!/bin/bash

set -e 

echo "Installing Jaehoon's Personal script"

mac_nvim_nightly_link="https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz"

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac

echo "It seems like you are running ${machine} on this computer"

if [ $machine == "Mac" ]; then
    echo "I see that you are running mac"
    
    echo "Checking if brew was installed"
    if ! command -v brew &> /dev/null
    then
        echo "brew could not be found; installing brew"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    echo "Checking if tmux is installed"
    if ! command -v tmux &> /dev/null
    then
        echo "tmux could not be found; installing tmux via brew"
        brew install tmux
    fi

    echo "Copying tmux configuration"

    if test -f "~/.tmux.conf"; then
        echo "Backing dot.tmux_conf file"
        mv ~/.tmux.conf ~/.tmux_backup.conf
    fi 

    cp ./unix/dot.tmux.conf ~/.tmux.conf
    cp ./unix/tmux ~/.tmux

    echo "Checking if zsh is installed"
    if ! command -v zsh &> /dev/null
    then
        echo "zsh could not be found; installing zsh via brew"
        brew install zsh
    fi

    echo "Checking if oh-my-zsh is installed"

    if [[ $ZSH == *"oh-my-zsh"* ]]; then
        echo "Found default oh-my-zsh installing; skipping installing ohmyzsh"
    else
        echo "Could not find default oh-my-zsh installation; installing ohmyzsh"
        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi 

    echo "Checking if zsh/powerlevel9k exist"

    if [ ! -d $HOME/.oh-my-zsh/custom/themes/powerlevel9k ]; then 
        echo "Powerlevel9k does not exist; cloning from repo"
        git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
        echo "Installing syntax highlighting for zsh"
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
        pip install --user powerline-status
    fi

    echo "Check if Isoveka nerd font exists"

    if [ ! ls -R ~/Library/Fonts | grep "Nerd Font" ]; then
        echo "Installing Isoevka nerd font through brew"
        brew tap homebrew/cask-fonts 
        brew install font-iosevka-nerd-font || true
    fi
    echo "Moving zshrc script"
    if test -f "~/.zshrc"; then
        echo "Backing dot.zshrc file"
        mv ~/.zshrc ~/.zshrc_backup
    fi 
    cp ./osx/dot.zshrc ~/.zshrc

    echo "Check to see if Neovim needs to be installed"
    if ! command -v nvim &> /dev/null; then 
        echo "Neovim could not be found; installing"
        mkdir -p $HOME/nvim_nightly
        wget -P $HOME/nvim_nightly/ $mac_nvim_nightly_link
        tar -xf $HOME/nvim_nightly/nvim-macos.tar.gz -C $HOME/nvim_nightly
        echo "Cleaning up tar.gz file(s)"
        rm $HOME/nvim_nghtly/*.tar.gz*
    fi 

    echo "Moving init.vim script"
    if test -f "~/.config/nvim/init.vim"; then
        echo "Backing dot.zshrc file"
        mv ~/.config/nvim/init.vim ~/.config/nvim/init_backup.vim
    fi 
    cp ./unix/init.vim ~/.config/nvim/init.vim


    echo "Check to see if vim-plug is installed"
    if ! test -f "$HOME/.config/nvim/autoload/plug.vim"; then
        echo "Installing vim-plug"
        sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    fi 

    echo "Installing Plugins"
    vim +PlugInstall +qall
fi
