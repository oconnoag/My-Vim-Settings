# Set up main .vimrc (this file will pull in features from this .vim 
#  - I have it set up this way so that I can version control my .vimrc file easily
mv ~/.vim/save_this_as_dotvimrc_in_home_dir ~/.vimrc

####################################################################################################
# Set up plugins
####################################################################################################
# Python Mode
cd ~/.vim/bundle && git clone --recurse-submodules https://github.com/python-mode/python-mode.git
