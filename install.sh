# Install NeoVIM
apt install neovim python3-neovim

# Install Vim Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install node
curl -sL install-node.now.sh/lts | bash

# Install yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn

# Install nvim config
NVIMDIR="~/.config/test"

if [ ! -d "$NVIMDIR" ]; then
  echo "== ${NVIMDIR} doesn't exist"
  echo "== create ${NVIMDIR}"
  mkdir -p "$NVIMDIR"
fi

echo "== create symlink ${NVIMDIR}/init.vim"
ln -s .init.vim "${NVIMDIR}/init.vim"
