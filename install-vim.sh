# display a message in red with a cross by it
# example
# echo echo_fail "No"
function echo_fail {
  # echo first argument in red
  printf "\e[31m✘ ${1}"
  # reset colours back to normal
  printf "\033\e[0m"
  echo ""
}

# display a message in green with a tick by it
# example
# echo echo_fail "Yes"
function echo_pass {
  # echo first argument in green
  printf "\e[32m✔ ${1}"
  # reset colours back to normal
  printf "\033\e[0m"
  echo ""
}

function program_is_installed {
  # set to 1 initially
  local return_=1
  # set to 0 if not found
  type $1 >/dev/null 2>&1 || { local return_=0; }
  # return value
  echo "$return_"
}

# Install dependencies
if [ $(program_is_installed nvim) == 1 ]; then
    echo_pass neovim
else
    echo_fail neovim
    sudo apt install neovim python3-neovim
fi

if [ $(program_is_installed node) == 1 ]; then
    echo_pass node
else
    echo_fail node
    curl -sL install-node.now.sh/lts | bash
fi

if [ $(program_is_installed yarn) == 1 ]; then
    echo_pass yarn
else
    echo_fail yarn
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    sudo apt-get update && sudo apt-get install yarn
fi

# Install nvim config
NVIMDIR=~/.config/nvim

if [ ! -d "$NVIMDIR" ]; then
  echo "== ${NVIMDIR} doesn't exist"
  echo "== create ${NVIMDIR}"
  mkdir -p "$NVIMDIR"
fi

echo "== create symlink ${NVIMDIR}/init.vim"
ln -s ~/dotfiles/init.vim "${NVIMDIR}/init.vim"
