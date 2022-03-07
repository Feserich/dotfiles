

## About

### Installing

```console
$ make
```

This will create symlinks from this repo to your home folder.

### Customizing

Save env vars, etc in a `.extra` file, that looks something like
this:

```bash
###
### Git credentials
###

GIT_AUTHOR_NAME="Your Name"
GIT_AUTHOR_EMAIL="email@you.com"

GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
git config --global user.email "$GIT_AUTHOR_EMAIL"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
GH_USER="$GIT_AUTHOR_NAME"
git config --global github.user "$GH_USER"
```

## Credits
jessfraz's [dotfiles](https://github.com/jessfraz/dotfiles)

amix's [vimrc](https://github.com/amix/vimrc)
