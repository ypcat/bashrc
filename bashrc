PS1='[\u@\h \w] '
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ls='ls -FG'
alias vg='vimgolf put'

export PATH=$PATH:$HOME/bin
export PYTHONSTARTUP=$HOME/.pythonrc

function git_diff() {
    git diff --no-ext-diff -w "$@" | vim -R -
}

