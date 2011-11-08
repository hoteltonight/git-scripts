#!/bin/bash
set -e
BRANCH=`current_branch`

# Not technically necessary if we're using a remote, but doesn't hurt to keep master up to date
# and is expected during ship
git checkout master
git pull origin
git checkout $BRANCH

if has_remote $BRANCH; then
  # If the branch is shared, treat the remote branch as our effective master during hack
  # We can't safely rebase onto master, and we don't want to merge master if we might
  # later rebase before pushing
  git pull origin $BRANCH

  # Before rebasing, we need to make sure we don't have any commits in our local branch that
  # aren't in the remote branch, and came from a merge with master or something, rather than
  # being new local changes.
  for COMMIT in `git rev-list origin/$BRANCH..`; do
    if [ `git branch --contains $COMMIT | wc -l` != 1 ]; then
      echo "Exiting; this doesn't look like a safe commit to rebase:"
      git log -1 $COMMIT
      echo "Please either manually push to your remote, or otherwise clean up this mess."
      exit 1
    fi
  done

  git rebase origin/$BRANCH

else # If the branch isn't shared, proceed as normal
  git rebase master
fi

