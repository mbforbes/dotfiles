# thanks Stuart Reges now I'm permanently brainwashed
EDITOR='emacs -nw'

# So yeah this is fun.
export PS1="\[\033[38;5;9m\]{?\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;9m\]\$?}\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;10m\][\t]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;11m\]\u@\h\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;14m\][\[$(tput bold)\]\w\[$(tput sgr0)\]]\[$(tput sgr0)\]\[\033[38;5;15m\]\n\[$(tput bold)\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"

# iterm2 crap
[[ $TERM_PROGRAM == "iTerm.app" ]] && test -r ~/.iterm2_shell_integration.bash && source ~/.iterm2_shell_integration.bash
export iterm2_hostname=gengar

# u might need CUDA stuff

# u'll probably need pyenv stuff
