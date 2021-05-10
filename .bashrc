# Python virtualenv
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Dev

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

PROMPT_DIRTRIM=3

# If we have external bash alias file
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

# Tmuxinator Autocomplete
source /usr/local/bin/tmuxinator_completion.bash

export JAVA_HOME="$HOME/.jenv/versions/`jenv version-name`"
alias jenv_set_java_home="export JAVA_HOME=$HOME/.jenv/versions/`jenv version-name`"

# Ruby
export GEM_HOME="$HOME/.gem"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
