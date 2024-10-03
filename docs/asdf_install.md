```bash 
apt install -y git build-essential
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.1
echo '. "$HOME/.asdf/asdf.sh"' >> $HOME/.bashrc
echo '. "$HOME/.asdf/completions/asdf.bash"' >> $HOME/.bashrc
source ~/.bashrc
asdf plugin add python
apt install -y zlib1g-dev libssl-dev  libbz2-dev  libncurses5-dev libreadline-dev libsqlite3-dev lzma-dev libffi-dev liblzma-dev
asdf install python 3.12.4
asdf global python 3.12.4
# Optional
asdf plugin add nodejs
asdf install nodejs 20.17.0
asdf global nodejs 20.17.0
```
