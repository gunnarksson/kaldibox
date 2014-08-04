# paths
export KALDI_HOME=___KALDI_HOME___
export PATH=$KALDI_HOME/tools/openfst/bin:$KALDI_HOME/src/bin:$KALDI_HOME/src/fstbin:$KALDI_HOME/src/featbin:$KALDI_HOME/src/featbin:$KALDI_HOME/src/onlinebin:$KALDI_HOME/src/gmmbin:$KALDI_HOME/src/latbin:$PATH

# misc
export LC_ALL=C
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE="$HOME/.histfile"

# shell specific settings
if [ ! -z $BASH_VERSION ]; then
  shopt -s histappend
  export PS1='\n\[\033[0;35m\]\u@\h\[\033[00m\]:\w \n$ '
fi

# aliases
alias ll='ls -Alh --color'
alias cdkaldi='cd $KALDI_HOME'
alias cdexperiment='cd /vagrant/experiment'

CUSTOM=/vagrant/experiment/user.sh
if [ -f $CUSTOM ]; then
  . $CUSTOM
fi
