# meta
alias erc='emacs ~/.bashrc'
alias ea='emacs ~/.bash_aliases'
alias rebash='source ~/.bashrc'

# general
alias u='cd ..'

# git
alias gs='git status'
alias gitb='git branch'
alias gitd='git diff'
alias gitr='git remote -v'
alias ge='git push origin'
alias gpull='git pull --rebase origin'

# projects quick nav
alias repos='cd ~/repos'

# python
# ---
alias piup='pip install --upgrade pip'

# mac only. you don't get some of these fun ones to start wheeee.
# ---
# ls fun
alias ll='ls -lahF'
alias l='ll'


# linux only.
# ---

# gpu machine only. dashboards.
alias gpus='watch -n 0.5 nvidia-smi'
alias gpu='gpus'

# If GUI: pick the program for me please
alias open='xdg-open'

# ssh
alias akp='eval "$(ssh-agent -s)"'
alias ak='ssh-add ~/.ssh/id_rsa'
