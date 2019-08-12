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


