echo "Downloading dotfiles"
git clone https://github.com/clemkoa/dotfiles.git ~/.dotfiles

echo "Creating symlinks"
ln -sf ~/.dotfiles/git/.gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/git/.gitexcludes ~/.gitexcludes
ln -sfn ~/.dotfiles/zsh ~/.zsh
ln -sf ~/.dotfiles/zsh/.zshrc ~/.zshrc

echo "Updating gitconfig"
NAME=$(git config --global user.name)
read -e -p "Git name: ($NAME) " NAME
git config --global user.name $NAME
EMAIL=$(git config --global user.email)
read -e -p "Git email: ($EMAIL) " EMAIL
git config --global user.email $EMAIL

echo "All done - Enjoy"
