log() { echo "\033[32m$@\033[0m"; }

which brew &>/dev/null || {
  log "Install Package Manager"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  xcode-select --install
}

echo "Brew packages"
brew install z zsh-syntax-highlighting zsh-history-substring-search diff-so-fancy
brew cask install iterm2 atom firefox

echo "Downloading dotfiles"
git clone https://github.com/clemkoa/dotfiles.git ~/.dotfiles

echo "Creating symlinks"
ln -sf ~/.dotfiles/git/.gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/git/.gitexcludes ~/.gitexcludes
ln -sf ~/.dotfiles/git/.githooks ~/.githooks
ln -sfn ~/.dotfiles/zsh ~/.zsh
ln -sf ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/vim/.vimrc ~/.vimrc

echo "Updating gitconfig"
NAME=$(git config --global user.name)
read -e -p "Git name: ($NAME) " NAME
git config --global user.name $NAME
EMAIL=$(git config --global user.email)
read -e -p "Git email: ($EMAIL) " EMAIL
git config --global user.email $EMAIL

defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write com.apple.LaunchServices LSQuarantine -bool false
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
defaults write NSGlobalDomain InitialKeyRepeat -int 10
defaults write NSGlobalDomain KeyRepeat -int 1

echo "All done - Enjoy"
zsh
