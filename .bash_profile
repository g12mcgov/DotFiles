source ~/.profile
source ~/.bash_aliases
source ~/.bashrc

# ------------------------------------------------------------------
# ENVIRONMENT
# ------------------------------------------------------------------

# Default Terminal path
cd ~/Dropbox/Developer/Projects

# Dynamically displays a truncated working dir path, plus the parent directory
# Taken from: http://stackoverflow.com/questions/5687446/bash-custom-ps1-with-nice-working-directory-path
export WORKING_DIR='$(echo -n "${PWD/#$HOME/~}" | awk -F "/" '"'"'{
if (length($0) > 14) { if (NF>4) print $1 "/" $2 "/.../" $(NF-1) "/" $NF;
else if (NF>3) print $1 "/" $2 "/.../" $NF;
else print $1 "/.../" $NF; }
else print $0;}'"'"')'
# Bash prompt
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]$(eval 'echo ${WORKING_DIR}')\[\033[94m\]\$(parse_git_branch)\[\033[00m\] $ "
# Default text editor
export EDITOR=/usr/bin/vim
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# ------------------------------------------------------------------
# PATH
# ------------------------------------------------------------------
export PATH=/usr/local/sbin:/usr/local/git/bin:/usr/local/bin:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/mysql/bin:/Users/grantmcgovern/.local/bin
export PATH="/usr/local/opt/sbt@0.13/bin:$PATH" # Scala sbt

#
# RUBY
#
export RUBY_PATH=/usr/local/Cellar/ruby/2.6.2
export GEM_BINARIES=/usr/local/lib/ruby/gems/2.6.0
export PATH=$RUBY_PATH/bin:$GEM_BINARIES/bin:$PATH

# ------------------------------------------------------------------
# JAVA
# ------------------------------------------------------------------
export GLASSFISH_HOME=/usr/local/opt/glassfish/libexec
export M2_HOME=/Users/$(whoami)/.m2
export PATH=$PATH:$GLASSFISH_HOME/bin

# ------------------------------------------------------------------
# GO
# ------------------------------------------------------------------
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

# ------------------------------------------------------------------
# MONGODB
# ------------------------------------------------------------------
export MONGO_PATH=/usr/local/mongodb
export PATH=$PATH:$MONGO_PATH/bin

# ------------------------------------------------------------------
# MY BINARIES
# ------------------------------------------------------------------
export MY_BINARIES=~/bin
export PATH=$PATH:$MY_BINARIES

# ------------------------------------------------------------------
# BASH COMPLETION
# ------------------------------------------------------------------

# Bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# ------------------------------------------------------------------
# UTILITIES
# ------------------------------------------------------------------

# Showa: to remind yourself of an alias (given some part of it)
showa () { /usr/bin/grep --color=always -i -a1 $@ ~/.bash_aliases | grep -v '^\s*$' | less -FSRXc ; }
# Shows current git branch in bash prompt
parse_git_branch() { git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/' ; }

zipf () { zip -r "$1".zip "$1" ; }          # zipf:         To create a ZIP archive of a folder
alias numFiles='echo $(ls -1 | wc -l)'      # numFiles:     Count of non-hidden files in current dir
alias make1mb='mkfile 1m ./1MB.dat'         # make1mb:      Creates a file of 1mb size (all zeros)
alias make5mb='mkfile 5m ./5MB.dat'         # make5mb:      Creates a file of 5mb size (all zeros)
alias make10mb='mkfile 10m ./10MB.dat'      # make10mb:     Creates a file of 10mb size (all zeros)

extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

# ------------------------------------------------------------------
# SEARCHING
# ------------------------------------------------------------------
alias qfind="find . -name "                 # qfind:    Quickly search for file
ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string
spotlight () { mdfind "kMDItemDisplayName == '$@'wc"; } # spotlight: Search for a file using MacOS Spotlight's metadata

# ------------------------------------------------------------------
# NETWORKING
# ------------------------------------------------------------------
alias myip='curl ip.appspot.com'                    # myip:         Public facing IP Address
alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections
alias showBlocked='sudo ipfw list'                  # showBlocked:  All ipfw rules inc/ blocked IPs

# ii:  display useful host related informaton
ii() {
    echo -e "\nYou are logged on ${RED}$HOST"
    echo -e "\nAdditionnal information:$NC " ; uname -a
    echo -e "\n${RED}Users logged on:$NC " ; w -h
    echo -e "\n${RED}Current date :$NC " ; date
    echo -e "\n${RED}Machine stats :$NC " ; uptime
    echo -e "\n${RED}Current network location :$NC " ; scselect
    echo -e "\n${RED}Public facing IP Address :$NC " ;myip
    #echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
    echo
}

# ------------------------------------------------------------------
# SYSTEM
# ------------------------------------------------------------------
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete" # cleanupDS:  Recursively delete .DS_Store files
alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE' # finderShowHidden:   Show hidden files in Finder
alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE' # finderHideHidden:   Hide hidden files in Finder
alias cleanupLS="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder" # cleanupLS:  Clean up LaunchServices to remove duplicates in the "Open With" menu
alias batteryCharges="system_profiler SPPowerDataType | grep \"Cycle Count\" | awk '{print $3}'"
alias batteryStatus="pmset -g batt"

# ------------------------------------------------------------------
# WEB DEVELOPMENT
# ------------------------------------------------------------------
alias apacheEdit='sudo edit /etc/httpd/httpd.conf'      # apacheEdit:       Edit httpd.conf
alias apacheRestart='sudo apachectl graceful'           # apacheRestart:    Restart Apache
alias editHosts='sudo edit /etc/hosts'                  # editHosts:        Edit /etc/hosts file
alias herr='tail /var/log/httpd/error_log'              # herr:             Tails HTTP error logs
alias apacheLogs="less +F /var/log/apache2/error_log"   # Apachelogs:   Shows apache error logs
httpHeaders () { /usr/bin/curl -I -L $@ ; }             # httpHeaders:      Grabs headers from web page

# jenv management
export PATH="/Users/grantmcgovern/.jenv/bin:$PATH"
eval "$(jenv init -)"

export CORAL_POSTGRES=postgresql://coral:coral@35.190.162.119:5432/coral?sslmode=disable

# rvm management

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
