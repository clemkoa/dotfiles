echo "Downloading dotfiles"
git clone https://github.com/clemkoa/dotfiles.git ~/.dotfiles

echo "Downloading Vundle.vim"
mkdir -p ~/.vim/tmp
mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Creating symlinks"
ln -sf ~/.dotfiles/git/.gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/git/.gitexcludes ~/.gitexcludes
ln -sf ~/.dotfiles/vim/.vimrc ~/.vimrc
ln -sfn ~/.dotfiles/zsh ~/.zsh
ln -sf ~/.dotfiles/zsh/.zshrc ~/.zshrc

echo "Updating gitconfig"
NAME=$(git config --global user.name)
read -e -p "Git name: ($NAME) " NAME
git config --global user.name $NAME
EMAIL=$(git config --global user.email)
read -e -p "Git email: ($EMAIL) " EMAIL
git config --global user.email $EMAIL

echo "Installing vim plugins"
vim +PluginInstall +qall

echo "All done - Enjoy"
