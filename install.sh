set -euo pipefail

append_to_zshrc() {
  sed -i -e "\$a\\
$1" ~/.zshrc
}

echo "Setting up Dotfiles Symlinks"
DOTFILES_PATH="$HOME/dotfiles"
# Symlink dotfiles to the root within your workspace
find $DOTFILES_PATH -type f -path "$DOTFILES_PATH/.*" |
while read df; do
  link=${df/$DOTFILES_PATH/$HOME}
  mkdir -p "$(dirname "$link")"
  ln -sf "$df" "$link"
done

echo "Setting up FZF"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --key-bindings --completion --no-update-rc --no-fish
append_to_zshrc "source /usr/share/doc/fzf/examples/key-bindings.zsh"
append_to_zshrc "source /usr/share/doc/fzf/examples/completion.zsh"

echo "Setting up Starship"
touch ~/.zshrc
curl -sS https://starship.rs/install.sh | sh -s -- -y
append_to_zshrc 'eval "$(starship init zsh)"'
source ~/.zshrc
starship preset plain-text-symbols -o ~/.config/starship.toml

