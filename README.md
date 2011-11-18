Hotel Tonight's git scripts for a workflow most like the GitHub flow.

See this blog post for some context: http://engineering.hoteltonight.com/79320846

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

# The Scripts

### borrow [<branch>]

With no arguments, updates and prunes your list of remotes, and outputs a list of the branches available to you from origin. With one of those branches as an argument, checks out a new tracking local copy of that branch for you.

### hack

For a local branch with no remote, rebases onto latest master. For a branch with a remote, rebases onto the latest from the remote.

### pack

Create a new *_release branch from your current branch, and interactively rebase that onto the latest master.

### runtests

Run your test suite. This is sometimes automatically called from 'share', when it seems advisable to double-check your build in the middle of the share process. You'll probably want to customize this. Should be run manually before 'share' or 'ship' unless you're running autotest or whatever.

### share [-notest]

Publish your work to the remote branch, or a create a remote of your local branch if none exists. Will perform an interactive rebase so you can squash changes, and merge in the latest from master, before pushing. If master has new changes, will invoke runtests after the merge but before the push, unless you ask it not to.

### ship

Interactively rebase your branch onto master, giving you a chance to squash the entire branch history, then merge your changes onto the head of master. Heed the warning at the end that after shipping, your local copy of the branch and its remote have conflicting history, and both should probably be removed.

### gbdone

Remove your current local branch, and its remote (if any). Note that this will abort if the default check that the local branch is fully merged fails, but DOES NOT check that the associated remote branch is also fully merged (which it normally would not appear to be, if you squashed the local version during ship).

## Utilities

### finish_ship

This will perform the final steps of the ship process, in case you run into conflicts during the rebase operation which you need to resolve before continuing. The 'ship' script will let you know when you're going to need to use this.

### current_branch, has_remote

These are used internally by the other scripts; there isn't normally any reason to call them directly from the command line.

