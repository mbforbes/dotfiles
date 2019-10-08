# dotfiles
ya

## Setup

This was in a file but I forgot about it so here it is now yaaaayyy

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

# on mac, probably install iTerm2

#
# (1) meta
#

# copy in .bash_aliases, then activate them
emacs ~/.bash_aliases
source ~/.bash_aliases

# copy in relevant .bashrc stuff then rebash
erc
rebash

# maybe copy in .tmux.conf, though maybe not if you're using iTerm2 on this
# computer or to access it. if you did, probably re-login?

#
# (2) ssh
#

# generate a key
ssh-keygen -t rsa -b 4096 -C "<computer-name>"

# now, re: ~/.ssh/id_rsa.pub
# - put pub into github (if coding or cloning stuff)
# - put pub into servers' ({re/bi/tr}icycle) authroized_keys (if copying data)

# now, re: ~/.ssh/authorized_keys:
# - put your base comps' (e.g., workstation, laptop) pubs in here


#
# (3) pyenv
#

# you might need this on ubuntu before install python versions
# reference: https://github.com/pyenv/pyenv/wiki/Common-build-problems
# cache:
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev

# install
# reference: https://github.com/pyenv/pyenv-installer
# cache:
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

# it will have you edit .bashrc to put crap in there
erc

# probably install a version you want
pyenv versions
pyenv install 3.x.x


#
# (4) Other configs
#

# make emacs save files in a temp dir somewhere.
cp .emacs ~/


#
# (5) mac only
#

# Reminders:
# - you may want to install homebrew
# - you may want to install some other apps (VS Code, Things, Day One,
#   Slack, Chrome, Spotify, Tomato One, any VPN software)

# OK let's get to the good stuff: legitifying the emacs keybindings
# Coutesy of https://gist.github.com/cheapRoc/9670905
mkdir -p ~/Library/KeyBindings/
cp EmacsKeyBinding.dict ~/Library/KeyBindings/DefaultKeyBinding.dict
```
