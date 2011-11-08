HotelTonight's git scripts for a workflow most like the GitHub flow.

More information coming soon.

See also:  http://scottchacon.com/2011/08/31/github-flow.html

# Installation

Clone this repo into your home directory, and then add it to your path:

    export PATH=$PATH:~/git-scripts

## Other optional stuff for your bashrc

You may want to put some of these handy things in at the same time, but they're not required for the scripts to work.

### GIT prompt fanciness

    # Linux
    source /etc/bash_completion.d/git 2>/dev/null

    # OS X
    source /usr/local/git/contrib/completion/git-completion.bash 2>/dev/null

    PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
    GIT_PS1_SHOWDIRTYSTATE=1
    GIT_PS1_SHOWSTASHSTATE=1
    GIT_PS1_SHOWUNTRACKEDFILES=1

### Some quick git aliases

    alias gac='git add .;git commit'
    alias gs='git status'
    alias gb='git branch'
    alias gco='git checkout'
    alias gcb='git checkout master && git pull && git checkout -b'
    alias gl='git log --oneline'

