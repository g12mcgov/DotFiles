# Adding the bin of my home directory to the path
##
export PATH=/Users/grantmcgovern/bin:$PATH
 
##
# Setting the correct version of Python
##
export VERSIONER_PYTHON_VERSION=2.7
 
alias ls="ls -G"
alias ll="ls -lGhF"
alias la="ls -A"
alias ld="ls -d"
alias ..="cd .."
alias ...="cd ../.."
alias vim="mvim"
alias vi="vim"
alias a2restart="sudo apachectl restart"
alias get_python_lib="python -c 'from distutils.sysconfig import get_python_lib; print get_python_lib();'"
alias psql="/Applications/Postgres.app/Contents/MacOS/bin/psql"
alias pg_dump="/Applications/Postgres.app/Contents/MacOS/bin/pg_dump"
alias e="subl . &"
alias ose='open /Applications/AppleScript/Script\ Editor.app/'

 
##
# Your previous /Users/grantmcgovern/.profile file was backed up as /Users/grantmcgovern/.profile.macports-saved_2013-06-14_at_18:00:27
##
 
# MacPorts Installer addition on 2013-06-14_at_18:00:27: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
 

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
