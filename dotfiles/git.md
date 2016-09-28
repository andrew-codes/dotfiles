# Git Enhancements

1. CLI auto-completion
2. Current branch in shell prompt
3. Shortcuts (defined below)

```bash
# Resetting/cleaning
rh # reset --hard and clean -fd
rh {remote} {branch} # optionally specificy remote and branch

# List branches
lb # list all local and remote branches
lb {branch} # list branches (local or remote) matching {branch}

# Set tracking branch
sb # set branch upstream to origin/{currentWorkingBranch}
sb {branch} # set branch upstream to origin/{branch}
sb {remote} {branch} # set branch upstream to {remote}/{branch}

# New feature branch
nf {feature-branch-name} # Create new branch based on current branch, push and set upstream (origin/{feature-branch-name})
nf {base_branch} {feature-branch-name} # Create a new branch based on {base_branch}, push and set upstream (origin/{feature-branch-name})

# Deleting branches
db {branch} # delete {branch} locally
db {remote} {branch} # delete {branch} locally and on {remote}

# Rebasing
rb # git rebase
rbo {new-parent} {commit-sha} # git rebase --onto {new-parent} {commit-sha}
rbc # git rebase --continue
rba # git rebase --abort
rbs # git rebase --skip

# Fetch all remotes
fa # fetches all remotes

# Stashing
stash # alias to git stash
stash pop # example of using with parameter

# Committing
commit "{message}" # commit with {message} commit message

# Pull with rebase
pull # pull with rebase from tracked branch
pull {branch} # pull w/rebase {branch} from origin
pull {remote} {branch} # pull w/rebase {branch} from {remote}

# Misc.
mt # git mergetool
dt # git difftool
st # git status
push # git push
glg # pretty printed git log with graph
```
