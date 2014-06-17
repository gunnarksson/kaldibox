# paths
export KALDI_HOME=___KALDI_HOME___
export PATH=$KALDI_HOME/tools/openfst/bin:$KALDI_HOME/src/bin:$PATH

# misc
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE="$HOME/.histfile"

# shell specific settings
if [ ! -z $BASH_VERSION ]; then
  shopt -s histappend
  export PS1='\n\[\033[0;35m\]\u@\h\[\033[00m\]:\w \nλ '
fi

# aliases
alias ll='ls -Alh'
alias cdkalditrunk='cd $KALDI_HOME'
