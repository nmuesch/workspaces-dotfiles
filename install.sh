# Setup FZF
echo "Setting up FZF"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --key-bindings --completion --no-update-rc --no-fish

# Setup Starship
echo "Setting up Starship"
touch ~/.zshrc
curl -sS https://starship.rs/install.sh | sh -s -- -y
sed -i '$a\'$'\n''eval "$(starship init zsh)"' ~/.zshrc
source ~/.zshrc
starship preset plain-text-symbols -o ~/.config/starship.toml
