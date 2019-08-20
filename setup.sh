# Set up main .vimrc (this file will pull in features from this .vim 
#  - I have it set up this way so that I can version control my .vimrc file easily
# (Only perform if that file exists)
FILE=~/.vim/save_this_as_dotvimrc_in_home_dir
if test -f "$FILE"; then
    mv $FILE ~/.vimrc
fi

####################################################################################################
# Set up plugins
####################################################################################################
# Store plugins in bundle directory
cd ~/.vim && mkdir bundle

# Nerdtree
cd ~/.vim/bundle/ && git clone https://github.com/scrooloose/nerdtree.git

# Syntastic
cd ~/.vim/bundle/ && git clone https://github.com/vim-syntastic/syntastic.git

# tcomment
cd ~/.vim/bundle/ && git clone https://github.com/tomtom/tcomment_vim.git

# supertab
cd ~/.vim/bundle/ && git clone https://github.com/ervandew/supertab.git

# ctrlp
cd ~/.vim/bundle && git clone https://github.com/ctrlpvim/ctrlp.vim

# vim-polyglot
cd ~/.vim/bundle && git clone https://github.com/sheerun/vim-polyglot.git

# gruvbox colorscheme
cd ~/.vim/bundle && git clone https://github.com/morhetz/gruvbox.git

# buffergator
cd ~/.vim/bundle && git clone https://github.com/jeetsukumaran/vim-buffergator.git

# vim-airline
cd ~/.vim/bundle && git clone https://github.com/vim-airline/vim-airline.git
cd ~/.vim/bundle && git clone https://github.com/vim-airline/vim-airline-themes 
