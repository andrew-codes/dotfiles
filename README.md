# Dotfiles and Dev Tools Settings
This is a collection of my dotfiles and dev tools settings/configurations.

## Requirements

1. Windows or OSX
2. Nodejs (unless manually symlinking dotfiles; see [dotfiles ReadMe](./dotfiles/README.md') for more details)

## Getting Started
Fork this repository and then clone it to your local machine. Next, be sure to update the `dotfiles/bash/env.sh` and the `dotfiles/git/.gitconfig` with your settings. Commit these and then push them back up to your fork. All dot files are intended to by symlinked into your user directory. This way thers is no need to keep this git repo and the "actual" dot files in sync; as they are one and the same. To automatically symlink all dotfiles appropriately, open your shell **as admin** and run `npm start`. The full steps can be found below.

```sh
# git clone this repo/your fork
cd devtools
# Update ./bash/env.sh in editor
# Update ./git/.gitconfig in edtitor
npm start
```

## What can it do?

* [git enhancements](./dotfiles/git.md)
* [shell enhancements](./dotfiles/shell.md)
* [v1 specific shell enhancements](./dotfiles/v1-shell.md)
