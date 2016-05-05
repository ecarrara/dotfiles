ZSH=$HOME/.oh-my-zsh

ZSH_THEME="afowler"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export EDITOR=vim

export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2
source /usr/bin/virtualenvwrapper.sh


export _JAVA_OPTIONS="-Djava.net.preferIPv4Stack=true"
