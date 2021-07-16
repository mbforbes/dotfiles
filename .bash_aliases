# meta
alias erc='emacs ~/.bashrc'
alias ea='emacs ~/.bash_aliases'
alias rebash='source ~/.bashrc'

# general
alias u='cd ..'

# ssh
alias akp='eval "$(ssh-agent -s)"'
alias ak='ssh-add ~/.ssh/id_rsa'

# git
alias gits='git status'
alias gitb='git branch'
alias gitd='git diff'
alias gitr='git remote -v'
alias ge='git push origin'
alias gpull='git pull --rebase origin'

# projects quick nav
alias repos='cd ~/repos'

# any remote aliases, e.g.,
alias recycle='ssh mbforbes@recycle'
alias bicycle='ssh mbforbes@bicycle'
alias tricycle='ssh mbforbes@tricycle'


# mac only. you don't get some of these fun ones to start wheeee.
# ---
# ls fun
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'


# linux only.
# ---

# gpu machine only. dashboards.
alias gpus='watch -n 0.5 nvidia-smi'
alias gpu='gpus'

# If GUI: pick the program for me please
alias open='xdg-open'
