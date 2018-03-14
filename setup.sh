#!/bin/bash

#
# This file probably shouldn't actullay be run. It's more of a bookkeeping
# reminder list.
#

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


#
# (1) meta
#

# copy in .bash_aliases, then activate them
emacs ~/.bash_aliases
source ~/.bash_aliases

# copy in relevant .bashrc stuff then rebash
erc
rebash

# copy in .tmux.conf
# re-login?


#
# (2) ssh
#

# generate a key
ssh-keygen -t rsa -C "<computer-name>"

# now, re: ~/.ssh/id_rsa.pub
# - put pub into github (if cloning stuff)
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
