```bash
apt install -y cmake gettext
git clone https://github.com/neovim/neovim ~/nvim
cd ~/nvim
make CMAKE_BUILD_TYPE=Release
make install
cd ~
rm -rfv ~/nvim
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
rm -rf ~/.config/nvim/.git
nvim
```
