# Install NeoVIM
apt install neovim python3-neovim

# Install Vim Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install nvim config
NVIMDIR="~/.config/test"

if [ ! -d "$NVIMDIR" ]; then
  echo "== ${NVIMDIR} doesn't exist"
  echo "== create ${NVIMDIR}"
  mkdir -p "$NVIMDIR"
fi

echo "== create symlink ${NVIMDIR}/init.vim"
ln -s .init.vim "${NVIMDIR}/init.vim"
