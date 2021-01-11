#!/bin/bash
# Set up main .vimrc with all pathogen plugins


install_via_brew_or_yum() {
    package=$1

    # Install bash-completion
    if type brew &> /dev/null; then
        brew install $package
    elif type yum &> /dev/null; then
        yum install -y $package
    else
        echo "Could not download $package on this system because there is no brew or yum present; need to find another way"
    fi
}

# Try to get the latest and greatest vim
# install_via_brew_or_yum vim@8.2

# Symlink .vimrc to home dir
ln -s ~/.vim/.vimrc ~/.vimrc

####################################################################################################
# Set up plugins
####################################################################################################

# Store plugins in bundle directory
cd ~/.vim && mkdir bundle
cd ~/.vim/bundle/

# Nerdtree
git clone https://github.com/scrooloose/nerdtree.git

# tcomment
git clone https://github.com/tomtom/tcomment_vim.git

# supertab
git clone https://github.com/ervandew/supertab.git

# ctrlp
git clone https://github.com/ctrlpvim/ctrlp.vim

# vim-polyglot
git clone https://github.com/sheerun/vim-polyglot.git

# gruvbox colorscheme
git clone https://github.com/morhetz/gruvbox.git

# buffergator
git clone https://github.com/jeetsukumaran/vim-buffergator.git

# vim-airline
git clone https://github.com/vim-airline/vim-airline.git
git clone https://github.com/vim-airline/vim-airline-themes

# gutentags (requires universal-ctags)
git clone https://github.com/ludovicchabant/vim-gutentags.git

# w0rp/ale
git clone https://github.com/dense-analysis/ale.git

# simpylfold - Python code folding
git clone https://github.com/tmhedberg/SimpylFold.git

# gitgutter
git clone git@github.com:airblade/vim-gitgutter.git

# vim-visual_multi
git clone git@github.com:mg979/vim-visual-multi.git

# jedi
git clone --recursive https://github.com/davidhalter/jedi-vim.git

# ctags for glutentags
if [ ! -z brew ]; then
    brew install --HEAD universal-ctags/universal-ctags/universal-ctags
fi

# Linters for ALE
[[ ! -z flake8 ]] || install_via_brew_or_yum flake8
[[ ! -z pylint ]] || install_via_brew_or_yum pylint
