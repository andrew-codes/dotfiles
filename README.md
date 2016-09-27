# Dotfiles and Dev Tools Settings
This is a collection of my dotfiles and dev tools settings/configurations.

## Requirements

1. Nodejs
2. Git

## Getting Started
Fork and clone this repository. Next, be sure to update the `dotfiles/bash/env.sh` and the `dotfiles/git/gitconfig` with your preferences. Commit these and then push them back up to your fork. All dot files are intended to by symlinked into your user directory. This way thers is no need to keep this git repo and the "actual" dot files in sync; as they are one and the same. To automatically symlink all dotfiles appropriately, open your shell as admin and run `npm start`. The full steps can be found below.

```sh
# git clone this repo/your fork
cd dotfiles
nano ./bash/env.sh
nano ./git/.gitconfig
npm start
```
