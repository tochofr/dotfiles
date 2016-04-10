#!/usr/bin/env bash

vimColors=~/.vim/colors
vundleDir=~/.vim/bundle

# === Check dependencies ===
# Checking git 
vimCmd=$(which vim)
if [[ $? -ne 0 ]]; then
    echo "ERROR: vim not found. Exit."
    exit 1
fi

# Checking git 
gitCmd=$(which git)
if [[ $? -ne 0 ]]; then
    echo "ERROR: git not found. Exit."
    exit 1
fi

# === Tmux section ===
cp -r tmux.conf ~/.tmux.conf

# === Vim Section ===
cp -r vimrc ~/.vimrc

# TEMP: Installs Tomorrow-Night-Bright theme
mkdir -p $vimColors
cp -r vim/* $vimColors 

# Install Vundle
if [[ ! -d $vundleDir ]]; then
    $gitCmd clone https://github.com/VundleVim/Vundle.vim.git\
        ~/.vim/bundle/Vundle.vim
fi

# Install plugins
$vimCmd +PluginInstall +qall
rm -fr $vimColors
# === Vim Section ===

# === Bash section ===
cp -r bashrc ~/.bashrc
cp -r bash_profile ~/.bash_profile
