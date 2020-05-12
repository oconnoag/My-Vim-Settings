#!/bin/bash
# Set up main .vimrc with all pathogen plugins

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

# Other dependencies (will only install if brew is installed)
if [ ! -z brew ]; then
    # Faster searching than ag
    [[ ! -z ripgrep ]] || brew install ripgrep

    # ctags for glutentags
    brew install --HEAD universal-ctags/universal-ctags/universal-ctags

    # Linters for ALE
    [[ ! -z flake8 ]] || brew install flake8
    [[ ! -z pylint ]] || brew install pylint
fi

