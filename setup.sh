#! /bin/zsh

cd "${0%/*}"

# Oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Link dotfiles
#
echo
echo Linking dotfiles
echo ----------------
echo

echo "Creating links to vim.rc, tmux.conf, and .zshrc files"

for dotfile in src/**/*; do
	destination=~/.${dotfile:4} # Remove src/ and prepend ~/.

	if [ -d "$dotfile" ] && [ ! -d "$destination" ]; then
		mkdir $destination
	fi

	if [ -f "$dotfile" ]; then
		echo "--- $dotfile -> $destination"
		ln -sf ${dotfile:P} "$destination"
	fi
done

# Install dependencies
#
echo
echo Installing dependencies
echo -----------------------
echo

function install {
  if ! command -v name &> /dev/null; then
    if command -v apt-get &> /dev/null; then
      sudo apt-get install -y $1
    elif command -v brew &> /dev/null; then
      brew install $1
    fi
  fi
  echo "--- $1 installed"
}

# Neovim
if command -v apt-get &> /dev/null; then
  sudo add-apt-repository ppa:neovim-ppa/unstable
  sudo apt-get update
fi
install neovim

curl -fLso ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim --headless +PlugInstall +qall
echo --- neovim configured
echo

# Silver Searcher
install silversearcher-ag

# fzf
install fzf
if command -v brew &> /dev/null; then
  $(brew --prefix)/opt/fzf/install
fi

if [[ $SPIN ]]; then
  git config --global user.email "lucas.kim@shopify.com"
  git config --global user.name "Lucas Kim"
  git config --global --unset-all credential.helper
fi
