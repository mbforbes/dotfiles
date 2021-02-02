# thanks Stuart Reges now I'm permanently brainwashed
EDITOR='emacs -nw'

# So yeah this is fun.
export PS1="\[\e[32m\][\[\e[m\]\[\e[32m\]\t\[\e[m\]\[\e[32m\]]\[\e[m\] \[\e[33m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[33m\]\h\[\e[m\] \[\e[36m\][\[\e[m\]\[\e[36m\]\w\[\e[m\]\[\e[36m\]]\[\e[m\] \n\\$ "

# Unified bash history [https://unix.stackexchange.com/a/48113]
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it
# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# u'll probably need pyenv stuff

# Custom scripts
export PATH="~/repos/dotfiles/scripts:$PATH"

# mac only. because it doesn't come with a default .bashrc (er, .bash_profile).
# ---

# colors!
alias grep='grep --color=auto'
export CLICOLOR="true"

# don't forget this
source ~/.bash_aliases

# linux only.
# ---

# iterm2 crap (for integration when ssh'ing in from a mac)
[[ $TERM_PROGRAM == "iTerm.app" ]] && test -r ~/.iterm2_shell_integration.bash && source ~/.iterm2_shell_integration.bash
export iterm2_hostname=gengar

# u might need CUDA stuff
