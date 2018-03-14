# meta
alias erc='emacs ~/.bashrc'
alias ea='emacs ~/.bash_aliases'
alias rebash='source ~/.bashrc'

# ubuntu
alias n='nautilus'
# TODO: make a shim that actually mimic's macOS' behavior
alias open='n'

# ssh
alias akp='eval "$(ssh-agent -s)"'
alias ak='ssh-add ~/.ssh/id_rsa'

# git
alias gits='git status'
alias gitb='git branch'
alias gitd='git diff'
alias gitr='git remote -v'
alias ge='git push origin master'
alias gpull='git pull --rebase origin master'

# projects quick nav
alias repos='cd ~/repos'

# remote
alias recycle='ssh mbforbes@recycle'
alias bicycle='ssh mbforbes@bicycle'
alias tricycle='ssh mbforbes@tricycle'

# dashboards
alias gpus='watch -n 0.5 nvidia-smi'
