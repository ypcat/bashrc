
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ls='ls -FG'
alias vg='vimgolf put'

function truncate_pwd
{
  if [ $HOME == "$PWD" ]
  then
    newPWD="~"
  elif [ $HOME ==  "${PWD:0:${#HOME}}" ]
  then
    newPWD="~${PWD:${#HOME}}"
  else
    newPWD=$PWD
  fi

  local pwdmaxlen=30
  if [ ${#newPWD} -gt $pwdmaxlen ]
  then
    local pwdoffset=$(( $pwdmaxlen / 2 ))
    newPWD="${newPWD:0:$pwdoffset}...${newPWD:(-$pwdoffset):$pwdmaxlen}"
  fi
}
PROMPT_COMMAND=truncate_pwd
export PS1="\u@mbp:\$newPWD$ "
#export PS1='[\u@\h \w] '

export PATH=$PATH:$HOME/bin:$HOME/sat/bin
export LC_ALL="en_US.UTF-8"

export PYTHONSTARTUP=$HOME/.pythonrc
export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/site-packages

export VISUAL=vim
export EDITOR=vim

export P4USER=plee
#export P4PORT=10.160.23.134:1666
export P4PORT=PERFORCE-COLO2:1666
export P4DIFF=p4merge

export SOLN_ROOT=~/src/solutions
export SPLUNK_HOME=~/splunk
export PATH=$PATH:$SPLUNK_HOME/bin

. ~/bin/ypcd.sh

function git_diff() {
    git diff --no-ext-diff -w "$@" | vim -R -
}

function cdmod() {
    if [ -z $1 ]
    then
        echo cdmod python_module
    else
        cd $(python -c "print(__import__('os').path.dirname(__import__('$1').__file__))")
    fi
}

