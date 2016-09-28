# Dotfiles
This is a collection of my dotfiles. All dot files are intended to by symlinked into your user directory. In doing so, changes made to the dotfiles "on the fly" can be easily committed to the devtools repository.

## Requirements

1. Windows or OSX
2. Nodejs

## Getting Started
Be sure to update the `dotfiles/bash/env.sh` and the `dotfiles/git/.gitconfig` with your settings. To automatically symlink all dotfiles appropriately, open your shell and run `npm start`. **Windows will require running as administrator**. The full steps can be found below.

```sh
# git clone this repo/your fork
cd dotfiles
# Update ./bash/env.sh in editor
# Update ./git/.gitconfig in edtitor
node ./index.js
```
