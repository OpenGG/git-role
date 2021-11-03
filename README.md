# git-role

Setup multiple git user in same environment.

## Usage

Setup git user with command

```bash
# With curl
curl -o- https://raw.githubusercontent.com/OpenGG/git-role/main/gr.sh | bash

# Or with wget
wget -qO- https://raw.githubusercontent.com/OpenGG/git-role/main/gr.sh | bash
```

## Use case

1. Github user 0 in `~/github/`, gitlab user 1 in `~/gitlab/`.
2. Each git user with different user name, email and ssh key.

```bash
# github user

cd ~/github/
git clone git@github.com:vuejs/vue.git
cd vue

git config --list
# printing:
# user.name=github
# user.email=github@gmail.com

# gitlab user

cd ~/gitlab/
git clone git@gitlab.com:gnachman/iterm2.git
cd iterm2

git config --list
# printing:
# user.name=gitlab
# user.email=gitlab@gmail.com
```
