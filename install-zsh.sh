# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Setup
sed -i "s|plugins=(git)|plugins=(git zsh-autosuggestions zsh-syntax-highlighting)|g" ~/.zshrc
echo "alias vim=\"nvim\"">> ~/.zshrc
echo "alias vi=\"nvim\"">> ~/.zshrc
