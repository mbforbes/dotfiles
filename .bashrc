# thanks Stuart Reges now I'm permanently brainwashed
EDITOR='emacs -nw'

# So yeah this is fun.
export PS1="\[\e[32m\][\[\e[m\]\[\e[32m\]\t\[\e[m\]\[\e[32m\]]\[\e[m\] \[\e[33m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[33m\]\h\[\e[m\] \[\e[36m\][\[\e[m\]\[\e[36m\]\w\[\e[m\]\[\e[36m\]]\[\e[m\] \n\\$ "

# iterm2 crap
[[ $TERM_PROGRAM == "iTerm.app" ]] && test -r ~/.iterm2_shell_integration.bash && source ~/.iterm2_shell_integration.bash
export iterm2_hostname=gengar

# u might need CUDA stuff

# u'll probably need pyenv stuff
