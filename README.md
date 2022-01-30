# dotfiles
ya

## Setup

This was in a file but I forgot about it so here it is now yaaaayyy. Also note this was somewhat outdated when I did it on macOS---did some updates, but honestly, setting up a mac is fun and rare enough, whatever.

```bash
#
# (-1) whoops do u need a home dir and new password
#

sudo mkhomedir_helper <username>
passwd


#
# (0) pre
#

# install emacs, etc. ubuntu says:
sudo apt install emacs git

# on mac, probably:
# - do software updates
# - install iTerm2, vscode, omz, homebrew, iterm2 color profiles


#
# (1) meta
#

# bash setup was copied here, but now directly linking after cloning below. if quickly
# configuring foreign comp, just copy in some bash aliases

# maybe copy in .tmux.conf, though maybe not if you're using iTerm2 on this
# computer or to access it. if you did, probably re-login?

#
# (1.5) zsh
#

# uhh, where should this go exactly?
# - install omz, powerlevel10k
# - install other omz plugins (zsh-syntax-highlighting)

#
# (2) ssh
#

# generate a key
ssh-keygen -t rsa -b 4096 -C "<computer-name>"

# now, re: ~/.ssh/id_rsa.pub, put it into
# - github  (if coding or cloning stuff)
# and maybe
# - other servers' authorized keys (if copying data)
# if you install github command line (gh), it takes care of this

# now, re: ~/.ssh/authorized_keys:
# - put your base comps' (e.g., workstation, laptop) pubs in here

# macOS: add ssh key to keychain
# https://apple.stackexchange.com/questions/48502/how-can-i-permanently-add-my-ssh-private-key-to-keychain-so-it-is-automatically

#
# (3) pyenv
#

# you might need this on ubuntu before install python versions
# reference: https://github.com/pyenv/pyenv/wiki/Common-build-problems
# cache:
sudo apt-get update
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python-openssl git

# install
# reference: https://github.com/pyenv/pyenv-installer
# old:
# curl https://pyenv.run | bash
# mac:
brew install pyenv

# note w/ zsh, there's stuff in .zshrc and ./zprofile
# it will have you edit .profile and .bashrc to put crap in there
emacs ~/.profile
erc

# probably install a version you want
pyenv versions
pyenv install 3.x.x


#
# (4) Other configs
#

# download this repo for files
mkdir ~/repos/
cd ~/repos/
git clone git@github.com:mbforbes/dotfiles.git

# make emacs save files in a temp dir somewhere
cp ~/repos/dotfiles/.emacs ~/

# make tmux not conflict w/ emacs keybindings
cp ~/repos/dotfiles/.tmux.conf ~/

# git config
git config --global core.excludesfile ~/repos/dotfiles/.gitignore_global
git config --global user.email "<gmail>"
git config --global user.name "<first> <last>"

# set link to aliases; put in ~/.zshrc
# source ~/repos/dotfiles/.zsh_aliases

# add custom scripts to path to ~/.zshrc (e.g., @ end)
# export PATH=~/repos/dotfiles/scripts:$PATH

#
# (5) mac only
#

# Stuff to brew install
brew update
brew install gh pyenv pyenv-virtualenv # tmux watch

# Fix some iterm2 config
# - Profiles > Keys > both options as Esc+
# - Keys > Key Bindings: make option+H send hex codes: 0x1B 0x08

# Shell utilities: `imgcat`
curl https://www.iterm2.com/utilities/imgcat > /usr/local/bin/imgcat
chmod u+x /usr/local/bin/imgcat

# Legitifying the emacs keybindings
# Courtesy of https://gist.github.com/cheapRoc/9670905
mkdir -p ~/Library/KeyBindings/
cp EmacsKeyBinding.dict ~/Library/KeyBindings/DefaultKeyBinding.dict
```
